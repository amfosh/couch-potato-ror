class ApplicationController < ActionController::Base

  def current_user
    User.find(session[:user_id])
  end

  def admin?
    current_user.admin
  end

  helper_method :current_user
end