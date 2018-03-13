class AvailabilitiesController < ApplicationController
  def index
  end

  def update
    if params[:user] && params[:user][:availability_ids]
      current_user.availabilities.each do |availability|
        if params[:user][:availability_ids].include? availability.id.to_s
          availability.available = !availability.available
          availability.save!
        end
      end
    end

    redirect_to user_path(current_user)
  end
end
