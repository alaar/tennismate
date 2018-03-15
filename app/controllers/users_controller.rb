
class UsersController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_user, only: [:show, :edit, :update]

  def show
    # if @user == current_user, display user profile with option to edit
      authorize @user
    # if noth @user != current_user, display opponent profile with send request button
    @match = Match.new()
  end

  def edit
    authorize @user
  end

  # def update
  #   @user.edit(user_params)
  #   authorize @user
  # end

  def index
    query = params[:query]

    @users = if query.present?
      sql_query = " \
        users.last_name ILIKE :query \
        OR users.first_name ILIKE :query \
        OR users.gender ILIKE :query \
        OR users.skill_level = :skill_level \
        OR availabilities.day ILIKE :query \
        OR availabilities.time ILIKE :query \
      "
      User
        .joins(:availabilities)
        .where(sql_query, query: "%#{query}%", skill_level: query.to_i)
        .distinct
    else
      courts_and_players
    end

    markers
  end


  def update
    @user.update_attributes!(user_params)
    redirect_to user_path(@user)
  end

private
  def user_params
    params.require(:user).permit(:gender, :skill_level, :age, :address, :radius, :photo)
  end

  def set_user
    @user = User.find(params[:id])
  end

  # method returns an array of users whose radius includes a given court based
  def users_near_court(court)
    users = User.where.not(latitude: nil, longitude: nil)
    p users
    users.select do |user|
      Court.near(user.address, user.radius).include?(court)
    end
  end

  #return courts that are whithin my radius
  def my_courts
    @my_courts ||= if current_user
      Court.near(current_user.address, current_user.radius)
    else
      Court.where.not(latitude: nil, longitude: nil)
    end
  end

  def courts_and_players
    return User.none if my_courts.empty?

    ids = my_courts.map(&:id).join(',')

    sql = "
      SELECT
        users.id as user_id,
        users.email,
        courts.id,
        courts.name,
        6371.0 * 2 * Asin(Sqrt(Power(Sin(( users.latitude - courts.latitude ) * Pi() / 180 / 2), 2) + Cos(users.latitude * Pi() / 180) * Cos( courts.latitude * Pi() / 180) * Power(Sin(( -73.6004519 - courts.longitude ) * Pi() / 180 / 2), 2))) AS distance,
        Mod(Cast(( Atan2(( ( courts.longitude - users.longitude ) / 57.2957795 ), ( (courts.latitude - users.latitude ) / 57.2957795 )) * 57.2957795 ) + 360 AS DECIMAL), 360)
      AS
        bearing
      FROM
        courts
      LEFT JOIN
        users on
        (( 6371.0 * 2 * Asin(Sqrt(Power(Sin(( users.latitude - courts.latitude ) * Pi() / 180 / 2), 2) + Cos(users.latitude * Pi() / 180) * Cos(courts.latitude * Pi() / 180) * Power(Sin(( users.longitude - courts.longitude ) * Pi() / 180 / 2), 2))) )
        BETWEEN
          0.0 AND users.radius )
      WHERE
        courts.id in (#{ids})
      ORDER BY
        distance ASC
    "

    results = ActiveRecord::Base.connection.execute(sql)
    user_ids = results.map {|result| result['user_id'] }
    User.where(id: user_ids)
  end

  #return all players that are within the radius of the courts I am willing to play at
  def players_near_me
    users = []

    my_courts.each do |court|
      users_near_court(court).each do |user|
        users << user unless user == current_user
      end
    end

    return users.uniq
  end

  def markers
    @markers = my_courts.map do |court|
      {
        lat: court.latitude,
        lng: court.longitude
      }
    end
  end

end
