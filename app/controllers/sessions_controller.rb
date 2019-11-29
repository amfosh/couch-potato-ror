class SessionsController < ApplicationController

    def new
    end

    def create
      # if auth
      #   @user = User.find_or_create_by(uid: auth['uid']) do |u|
      #     u.username = auth['info']['name']
      #     u.email = auth['info']['email']
      #     u.password = SecureRandom.hex
      #   end
        
      #   session[:user_id] = @user.id
      #   redirect_to @user
    
      #   else
        @user = User.find_by(email: params[:session][:email])
        if @user && @user.authenticate(params[:session][:password])
            # invalid login and require login
            session[:user_id] = @user.id
            redirect_to @user
        else
            render :new
        end
    end


    def destroy
      session.clear
      redirect_to '/'
    end

  private

  def auth
    request.env['omniauth.auth']
  end
end