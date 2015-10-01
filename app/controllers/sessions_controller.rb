class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where(username: params[:username]).first
    if user && user.authenticate(params[:password])
      session[:userid] = user.id
      redirect_to root_url, notice: "Logged in"
    else
      flash[:error] = "Username and Password do not match."
      redirect_to root_url
    end
  end

  def destroy
    session[:userid] = nil
    redirect_to root_url, notice: "Logged out."
  end

end
