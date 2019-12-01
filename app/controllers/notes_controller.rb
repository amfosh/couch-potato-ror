class NotesController < ApplicationController

    def new
        if @show = Show.find_by_id(params[:show_id])
           @note = @show.notes.build
        else
            @show = Show.new
        end
    end
    
    def create
        @note = current_user.notes.build(note_params)
        if @note.save
            redirect_to note_path(@note)
        else
            render :new
        end
    end

    def index
    end
end