class ShowsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new 
    @show = Show.new
  end

  def create
    @show = Show.new(show_params)
    @show.user_id = session[:user_id]
    if @show.save
      redirect_to show_path(@show)
    else
      render :new
    end
  end

  def show 
    @show = Show.find_by_id(params[:id])
    unless session[:user_id] == @show.user_id
      flash[:notice] = "You don't have access to that page!"
      redirect_to shows_path(session[:user_id])
      return
    end
  end
  
  def edit
    @show = Show.find_by(params[:id])
  end

  def destroy
    Show.find(params[:id]).destroy
    redirect_to shows_path
  end

  def update
    @show = Show.find(params[:id])
    @show.update(show_title: params[:show][:show_title])
    redirect_to show_path(@show)
  end

  def index
    if logged_in?
      @user = current_user
      @shows = current_user.shows
    end
  end

  def just_added
    if logged_in?
      @user = current_user
      @shows = current_user.shows.just_added
    end
  end

  private

  def show_params
    params.require(:show).permit(:show_title, :status_id, :note_id)
  end
end