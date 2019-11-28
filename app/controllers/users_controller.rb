class UsersController < ApplicationController
    before_action :require_login, only: :show
    # helper_method :logged_in?
    
#   def logged_in?
#     !current_user.nil?
#   end

  def new
    @user = User.new
  end

  def create
      @user = User.create(user_params)
      if @user.save
        log_in(@user)
        redirect_to user_path(@user)
      else
        render :new
      end
    end

  def show
      @user = User.find(params[:id])
  end


  private

  def user_params
      params.require(:user).permit(:username, :email, :password)
  end

  def require_login
      redirect_to '/' unless session.include? :user_id
  end
end