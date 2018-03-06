class UsersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_user, only: [:show]

  def show
    authorize @user
    @user = User.new()
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

    # @offers = policy_scope(Offer).order(created_at: :desc)
  end



private
  def set_user
    @user = User.find(params[:id])
    authorize @user
  end


end
