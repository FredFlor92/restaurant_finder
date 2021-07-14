class SessionsController < ApplicationController

  def index 
  end 

  def new
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password]) 
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else 
      flash[:message] = "Sorry, please try again"
      redirect_to login_path
      end 
    end 

  def create
  end 

  def home
  end 

  def destroy
    session.clear
    redirect_to root_path
  end 

  private 
end
