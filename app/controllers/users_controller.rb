class UsersController < ApplicationController
    
  def logged_in?
    !current_user.nil?
  end

  def new
    # if logged_in?
    #   redirect_to user_path
    # else
      @user = User.new
    # end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    redirect_to "/" if !@user
#     if logged_in?
#       if @user == User.find_by(id: params[:id])
#         render :layout => "application"
#       else
#         redirect_to user_path(@user)
#       end
#     else
#       redirect_to login_path
#     end
  end

  private

  def user_params
      params.require(:user).permit(:username, :email, :password)
  end

#   def require_login
#       redirect_to '/' unless session.include? :user_id
#   end
end