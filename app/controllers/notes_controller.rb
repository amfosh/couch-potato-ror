class NotesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
      if @show = Show.find_by_id(params[:show_id])
        @notes = @show.notes
      else
        @notes = Note.all
      end
    end
    #   if @show = Show.find_by_id(params[:id])
    #     @notes = @show.notes
    #   else
    #     @notes = current_user.notes
    #   end
    # end

    def new
      if @show = Show.find_by(id: params[:id])
          @note = @show.notes.build
      else
          @note = Note.new
      end
    end
    
    def create
      # byebug
      if current_user && @show = Show.find_by(id: params[:id])
      @note = @show.notes.create!(note_params)
      @note.user = current_user
      if @note.save
        redirect_to show_note_path(@note.show, @note)
      else
        render :new
      end
    else
      # byebug
      @note = current_user.notes.create!(note_params)
      if @note.save
        redirect_to note_path(@note)
      else
        render :new
      end
   end
  end
    # def new
    #   if @show = Show.find_by(id: params([:id])
    #     @note = @show.notes.build
    #   else
    #     @note = Note.new
    #   end
    # end
    
    # def create
    #   @show = Show.find_by(id: params([:id])
    #   @note = @show.notes.build(note_params)
    #   @note.user = current_user
    #   if @note.save
    #     redirect_to show_note_path(@note.show, @note)
    #     else
    #       render :new
    #     end
    #   else
    #     @note = current_user.notes.build(note_params)
    #     if @note.save
    #       redirect_to note_path(@note)
    #     else
    #       render :new
    #     end
    #  end


    def show
        @note = Note.find_by_id(params[:id])
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
        params.require(:note).permit(:content, :show_id, :user_id, show_attributes: :show_title)
    end

    # def set_show
    #     @show = Show.find(params[:show_id])
    #   end
      
    # def set_note
    #     @note = @show.notes.find(params[:id])
    # end
end