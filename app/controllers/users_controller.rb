class UsersController < ApplicationController
<<<<<<< HEAD
  # skip_before_action :authenticate_user!
=======
  skip_before_action :authenticate_user!
  before_action :set_user, only: [:show]
>>>>>>> 0a611823654cc63500cfbcba78d6454d7cc937dd

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

<<<<<<< HEAD
    # @users = policy_scope(User).order(created_at: :desc)

=======
    # @offers = policy_scope(Offer).order(created_at: :desc)
>>>>>>> 0a611823654cc63500cfbcba78d6454d7cc937dd
  end



private
  def set_user
    @user = User.find(params[:id])
    authorize @user
  end


end
