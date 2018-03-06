class UsersController < ApplicationController
before_action :set_user, only: [:show]

  def show
    authorize @user
    @user = User.new()
  end

  def index

  end



private
  def set_user
    @user = User.find(params[:id])
    authorize @user
  end


end
