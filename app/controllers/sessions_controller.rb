class SessionsController < ApplicationController

  def welcome
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/'
  end

  def new
  end

  def create 
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = "Sorry, login was incorrect. Please try again."
      redirect_to login_path
    end
  end
end
      # if auth
      #   @user = User.find_or_create_by(uid: auth['uid']) do |u|
      #     u.username = auth['info']['name']
      #     u.email = auth['info']['email']
      #     u.password = SecureRandom.hex
      #   end
        
      #   session[:user_id] = @user.id
      #   redirect_to @user
    
      #   else
    #     @user = User.find_by(email: params[:session][:email])
    #     if @user && @user.authenticate(params[:session][:password])
    #         # invalid login and require login
    #         session[:user_id] = @user.id
    #         redirect_to @user
    #     else
    #         render :new
    #     end
    # end


  # private

  # def auth
  #   request.env['omniauth.auth']
  # end