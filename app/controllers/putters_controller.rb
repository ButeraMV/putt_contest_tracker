class PuttersController < ApplicationController
  def index
    @putters = Putter.all
  end

  def new
    @putter = Putter.new
  end

  def create
    @putter = Putter.new(putter_params)
    if @putter.save
      redirect_to putters_path
    else
      render :new
    end
  end

  private
    def putter_params
      params.require(:putter).permit(:name, :contest_ids => [])
    end
end
