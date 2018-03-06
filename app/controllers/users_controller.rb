class UsersController < ApplicationController
  # skip_before_action :authenticate_user!

  def show
    authorize @user

  end

  def index
    # @users = User.all

    @users = User.where.not(latitude: nil, longitude: nil)

    @markers = @users.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end

    # @users = policy_scope(User).order(created_at: :desc)

  end

  # def new
  #   @user = User.new
  #   authorize @user
  # end

  # def create
  #   @user = User.new(user_params)
  #   @user = current_user
  #   authorize @user

  #   if @user.save!
  #     redirect_to users_path
  #   end
  # end

  # def destroy
  #   if @user.matches.empty?
  #     @user.destroy!
  #     redirect_to users_path
  #   else
  #     redirect_to user_path(@user)
  #   end
  # end

  # def update
  #   @user.update(user_params)
  #   redirect_to_ user_path(@user)
  # end

  private


end
