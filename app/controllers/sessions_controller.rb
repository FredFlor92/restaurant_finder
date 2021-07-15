class SessionsController < ApplicationController
  skip_before_action :redirect_if_not_logged_in
  
  def index 
  end 

  def new
    # @user = User.find_by(username: params[:user][:username])
    # if @user && @user.authenticate(params[:user][:password]) 
    #   session[:user_id] = @user.id
    #   redirect_to user_path(@user)
    # else 
    #   flash[:message] = "Sorry, please try again"
    #   redirect_to login_path
    #   end 
    end 

  def create
    if params[:provider] == 'google_oauth2'
      @user = User.create_by_google_omniauth(auth)
      session[:user_id] = @user.id
      redirect_to user_path(@user)

    else 
      @user = User.find_by(username: params[:user][:username]) 

      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id 
        redirect_to user_path(@user) 
      else 
        flash[:error] = "Sorry, please try again." 
        redirect_to login_path 
      end 
    end 
  end 

  def omniauth 
    @user = User.find_or_create_by(username: auth[info][:email]) do |u|
      u.email = auth[:info][:email]
      u.uid = auth[:uid]
      u.provider = auth[:provider]
      u.password = SecureRandom.hex(10)
    end 

    if @user.valid?
      session[:user_id] = @user.id
      redirect_to users_path
    else
      flash[:message] = "Credential error"
      redirect_to login_path
      endef create
  
      if params[:provider] == 'github'
        @user = User.create_by_github_omniauth(auth)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
  
    
        @user = User.find_by(username: params[:user][:username])
    
        if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id 
          redirect_to user_path(@user)
        else
          flash[:error] = "Sorry, login info was incorrect. Please try again."
          redirect_to login_path
        end
      end
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
