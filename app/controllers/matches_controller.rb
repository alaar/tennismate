class MatchesController < ApplicationController

  before_action :set_match, only: [:show, :update, :edit
  skip_before_action :verify_policy_scoped

  def index
  end

  def show
    authorize @match
  end

  def create
    @match = Match.new(status: "pending")
    #set the requester to current user
    @match.requester = current_user
    #set the approver to
    @user = User.find(params[:user_id])
    @match.approver = @user
    @match.court = Court.find(params[:match][:court])
    authorize @match
    if @match.save!
      redirect_to match_path(@match)
    end
  end

  def update
    if params[:commit] == "approve"
      @match.status = "accepted"
    elsif params[:commit] == "decline"
      @match.status = "rejected"
    end
    authorize @match
    @match.save!
    redirect_to match_path(@match)
  end

  private

  def set_match
    @match = Match.find(params[:id])
  end
end
