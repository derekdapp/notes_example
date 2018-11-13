class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def show
    set_note
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(notes_params)

    if @note.update(notes_params)
      redirect_to notes_path
    else
      render :new
    end
  end

  def edit
    set_note
  end

  def update
    set_note
    if @note.update(notes_params)
      redirect_to notes_path
    else
      render :edit
    end
  end

  def destroy
    set_note
    @note.destroy
    redirect_to notes_path
  end

  private
  def notes_params
    params.require(:note).permit(:title, :content)
  end

  def set_note
    @note = Note.find(params[:id])
  end
end
