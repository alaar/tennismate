class MatchesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_match, only: [:show, :update, :edit]
  #skip_before_action :verify_policy_scoped

  def index
    @authorize
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
    @match.day = params[:match][:availability].split(" ")[0]
    @match.time = params[:match][:availability].split(" ")[1]

    authorize @match
    if @match.save!
      redirect_to match_path(@match)
    end
  end

  def update
    if params[:commit] == "Approve"
      @match.status = "accepted"
    elsif params[:commit] == "Decline"
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
