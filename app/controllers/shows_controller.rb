class ShowsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new 
    @show = Show.new
  end

  def create
    @show = Show.new(show_params.except(:note))
    # byebug
    if @show.save
      @note = Note.new(show_params[:note])
      @note.user_id = session[:user_id]
      @note.show_id = @show.id
      @note.save
      redirect_to show_path(@show)
    else
      render :new
    end
  end

  def show 
    @show = Show.find_by_id(params[:id])
  end
  
  def edit
    @show = Show.find(params[:id])
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
    params.require(:show).permit(:show_title, :status_id, :note_id, note: :content)
  end
end