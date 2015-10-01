class RibitsController < ApplicationController
  def index
    @ribits = Ribit.all
    @ribit = Ribit.new
  end

  def create
    @ribit = Ribit.new(ribits_params)
    @ribit.user_id = current_user.id
    if @ribit.save
      redirect_to current_user
    else
      flash[:error] = "Error Posting Ribit"
      redirect_to current_user
    end
  end

  private
  def ribits_params
    params.require(:ribit).permit(:content, :user_id)
  end


end
