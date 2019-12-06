class ShowsController < ApplicationController

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
    @show = Show.find(params[:id])
  end
  
  def edit
  end

  def index
    if logged_in?
      @user = current_user
      @shows = current_user.shows 
    end
  end

  private

  def show_params
    params.require(:show).permit(:show_title, :status_id, status_attributes: [:watched])
  end
  # before_action :require_login





  # def new 
  #   @show = Show.new
  # end

  # def create
  #   @show = Show.new(show_params)
  #   if @show.save
  #     redirect_to @show
  #   else
  #     render :new
  #   end
  # end




  #   helpers do
  #     def redirect_if_not_authorized
  #       @show = Show.find_by_id(params[:id])
  #       if current_user != @show.user
  #         redirect '/shows'
  #       end
  #     end
    
  # #   get '/shows' do
  # #     if logged_in?
  # #       @user = current_user
  # #       @shows = current_user.shows 
  # #       erb:"shows/shows"
  # #     else
  # #       redirect "/login"
  # #     end
  # #   end
  
  # #   get '/shows/new' do
  # #     if logged_in?
  # #         erb :'/shows/new'
  # #     else
  # #         redirect "/login"
  # #     end
  # #   end
  
  # #   post '/shows' do
  # #     @s = current_user.shows.build(params)
  # #     if @s.save
  # #       redirect "/shows"
  # #     else
  # #       erb :"shows/new"
  # #     end
  # #   end
  
  # # get '/shows/:id/edit' do
  # #     if logged_in?
  # #       @show = Show.find_by_id(params[:id])
  # #     if @show.user_id == current_user.id
  # #       erb :'shows/edit'
  # #     else
  # #       redirect "/shows"
  # #     end
  # # end
  # # end
  
  # #   patch '/shows/:id' do
  # #     redirect_if_not_authorized
  
      
  # #     if !params[:show_title].empty? && params[:show_title].length > 2
  # #       @show.update(show_title: params[:show_title])
  # #       redirect "/shows/#{@show.id}"
  # #     else
  # #       @error = "The title isn't long enough!"
  # #       @show.show_title = params[:show_title]
  # #       erb:"/shows/edit"
  # #     end
  
  # # end
  
  # # get '/shows/:id' do
  # #     @show = Show.find_by(id: params[:id])
  # #     if logged_in?
  # #     erb :"/shows/show"
  # #   else
  # #     redirect "/login"
  # #   end
  # # end 
  
  # #   delete '/shows/:id/delete' do
  # #     @show = Show.find_by_id(params[:id])
  # #   if logged_in? && @show.user_id == current_user.id
  # #       @show.destroy
  # #       redirect "/shows"
  # #   else
  # #       redirect "/login"
  # #   end
  # # end
  # end
end