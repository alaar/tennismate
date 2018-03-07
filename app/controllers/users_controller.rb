class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_user, only: [:show]

  def show
    authorize @user
    # @user = User.new()
  end

  def index
    # @users = User.all

    # @users = User.where.not(latitude: nil, longitude: nil)

    # @markers = @users.map do |user|
    #   {
    #     lat: user.latitude,
    #     lng: user.longitude
    #   }

    # end

    # @offers = policy_scope(Offer).order(created_at: :desc)
    possible_index
  end



private
  def set_user
    @user = User.find(params[:id])
  end

  # method returns an array of users whose radius includes a given court based
  def users_near_court(court)
    @users = User.where.not(latitude: nil, longitude: nil)
    @users.select do |user|
      Court.near(user.address, user.radius).include?(court)
    end
  end

  #return courts that are whithin my radius
  def my_courts
    @courts = Court.near(current_user.address, current_user.radius)
  end

  #return all players that are within the radius of the courts I am willing to play at
  def players_near_me
    @users = []
    my_courts.each do |court|
      users_near_court(court).each do |user|
        @users << user
      end
    end
    return @users.uniq
  end

  def possible_index
    @users = players_near_me

    @markers = my_courts.map do |court|
      {
        lat: court.latitude,
        lng: court.longitude
      }
    end
  end
end
