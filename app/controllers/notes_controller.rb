class NotesController < ApplicationController
    before_action :redirect_if_not_logged_in

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
            redirect_to note_path(@note)
        else
            render :new
        end
    end

    def edit
        @note = Note.find_by_id(params[:id])
    end

    def update
        @note = Note.find_by_id(params[:id])
        @note.update(content: params[:note][:content])
        redirect_to note_path(@note)
      end

    def show
        @note = Note.find_by_id(params[:id])
    end

    def index
        if @show = Show.find_by_id(params[:show_id])
            @notes = @show.notes
        else
            @user = current_user
            @notes = current_user.notes 
        end
    end

    private

    def note_params
        params.require(:note).permit(:show_id, :content)
    end
end