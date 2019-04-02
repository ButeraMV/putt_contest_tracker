class ContestsController < ApplicationController
  def index
    @contests = Contest.all
  end

  def show
    @contest = Contest.find(params[:id])
    @enrollments = @contest.enrollments.where(active: true)
  end

  def new
    @contest = Contest.new
  end

  def create
    @contest = Contest.new(contest_params)
    if @contest.save
      redirect_to contests_path
    else
      render :new
    end
  end

  def update
    @contest = Contest.find(params[:id])
    byebug
  end

  def remove_enrollment
    contest = Contest.find(params[:contest_id])
    contest.enrollments.where(putter_id: params[:putter_id]).update(active: false)
  end

  private
    def contest_params
      params.require(:contest).permit(:name)
    end
end
