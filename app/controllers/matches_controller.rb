class MatchesController < ApplicationController
  def show
    @match = Match.find(params[:id])
  end

  def create
  end

  def update
  end
end
