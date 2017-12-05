class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to @genre
    else
      @genre.errors.full_messages.each do |msg|
        flash[:danger] = msg
      end

      redirect_to new_genre_path
    end
  end

  def new
    @genre = Genre.new
  end

  def show
    @genre = Genre.find(params[:id])
    @albums = Album.where(genre_id: params[:id])
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])

    if @genre.update(genre_params)
      redirect_to @genre
    else
      render 'edit'
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy

    redirect_to genres_path
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
