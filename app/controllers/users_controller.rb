class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    if current_user
      redirect_to buddies_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(users_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "Welcome to Ribbit!"
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @ribit = Ribit.new
    @relationship = Relationship.where(follower_id: current_user.id, followed_id: @user.id).first_or_initialize if current_user
  end

  def buddies
    if current_user
        @ribit = Ribit.new
        buddies_ids = current_user.followeds.map(&:id).push(current_user.id)
        @ribits = Ribit.where(user_id: buddies_ids)
    else
        redirect_to root_url
    end
end

private

def users_params
  params.require(:user).permit(:avatar_url, :email, :name, :password, :password_confirmation, :username)
end

end
