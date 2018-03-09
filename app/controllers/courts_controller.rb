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
    @courts = Court.where.not(latitude: nil, longitude: nil)
    @markers = @courts.map do |court|
      {
        lat: court.latitude,
        lng: court.longitude
      }
    end
  end
end
