class UsersController < ApplicationController
  def new
    @user = User.new
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

private

def users_params
  params.require(:user).permit(:avatar_url, :email, :name, :password, :password_confirmation, :username)
end

end
