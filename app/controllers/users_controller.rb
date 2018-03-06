class UsersController < ApplicationController
  skip_before_action :authenticate_user!

  def show
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
  end
end
