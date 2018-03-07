class CourtsController < ApplicationController

  skip_before_action :authenticate_user!

  def show
    @court = Court.find(params[:id])

    @marker = {
        lat: @court.latitude,
        lng: @court.longitude
      }
  end

  def index
  end
end
