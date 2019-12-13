class NotesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @notes = current_user.notes 
    end

    def new
        @note = Note.new
    end

     def create
        @note = Note.new(note_params)
        if @note.save
          redirect_to show_note_path
        else
          render 'new'
        end
     end

    def show
    end

    # def edit
    #     @note = Note.find_by_id(params[:id])
    # end

    # def update
    #     @note = Note.find_by_id(params[:id])
    #     @note.update(content: params[:note][:content])
    #     redirect_to note_path(@note)
    #   end



    private

    def note_params
        params.require(:note).permit(:content)
    end

    # def set_show
    #     @show = Show.find(params[:show_id])
    #   end
      
    # def set_note
    #     @note = @show.notes.find(params[:id])
    # end
end