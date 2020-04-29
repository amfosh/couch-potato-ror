class NotesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
      if @show = Show.find_by_id(params[:show_id])
        @notes = @show.notes
      else
        @notes = Note.all
      end
    end

    def new
      if @show = Show.find_by(id: params[:show_id])
          @note = @show.notes.build
      else
          @note = Note.new
      end
    end
    
    def create
      # if current_user && @show = Show.find_by(id: params[:id])
    #   @note = @show.notes.create!(note_params)
    #   @note.user = current_user
    #   if @note.save
    #     redirect_to show_note_path(@note.show, @note)
    #   else
    #     render :new
    #   end
    # else
      @note = current_user.notes.create!(note_params)
      if @note.save
        redirect_to show_note_path(@note.show, @note)
      else
        render :new
      end
   end


    def show
      @show = Show.find_by(id: params[:show_id])
      @note = Note.find_by_id(params[:id])
    end

    private

    def note_params
        params.require(:note).permit(:content, :show_id, :user_id, :status, show_attributes: :show_title)
    end
end