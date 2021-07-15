class SessionsController < ApplicationController
  skip_before_action :redirect_if_not_logged_in
  
 

  def new
  end 

  def create
    @user = User.find_by(username: params[:user][:username]) 
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id 
      redirect_to user_path(@user)
    else 
      flash[:error] = "Sorry, please try again." 
      render :new 
    end 

  end 


  def omniauth
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.username = auth['info']['name']
      u.email = auth['info']['email']
      #u.image = auth['info']['image']
      u.uid = auth['uid']
      u.provider = auth['provider']
      u.password = SecureRandom.hex(10)
    end
    if @user.save
      session[:user_id] = @user.id 
      redirect_to @user
    else
      flash.now[:danger] = 'Invalid credentials'
      render :new
    end
  end 

  def home
  end 

  def destroy
    session.delete(:user_id)
    redirect_to '/'
  end 

  private 

  def auth
    request.env['omniauth.auth']
  end
end
