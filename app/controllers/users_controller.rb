class UsersController < ApplicationController
    helper_method :logged_in?
    
#   def logged_in?
#     !current_user.nil?
#   end

  def new
    @user = User.new
  end

  def create
      @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to user_path(@user)
  end

  def show
      require_login
      @user = User.find(params[:id])
  end


  private

  def user_params
      params.require(:user).permit(:username, :password)
  end

  def require_login
      redirect_to '/' unless session.include? :user_id
  end
end