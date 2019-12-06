class NotesController < ApplicationController

    def new
        if @show = Show.find_by_id(params[:show_id])
           @note = @show.notes.build
        else
            @note = Note.new
        end
    end
    
    def create
        @note = current_user.notes.build(note_params)
    
        if @note.save
          redirect_to show_path(@show)
        else
          render 'new'
        end
      end

    def show
        @note = Note.find_by_id(params[:id])
      end

    def index
        if @show = Show.find_by_id(params[:show_id])
            @notes = @show.notes
        else
            @notes = Note.all
        end
    end

    private

    def note_params
        params.require(:note).permit(:show_id, :user_id, :content)
    end
end