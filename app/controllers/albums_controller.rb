class AlbumsController < ApplicationController
  def show
    @artist = Artist.find(params[:artist_id])
    @album = Album.find(params[:id])
    @songs = @album.songs
  end

  def index
    @artist = Artist.find(params[:artist_id])
    @albums = @artist.albums
  end

  def new
    @genres = Genre.all
    @artist = Artist.find(params[:artist_id])
    @genres = Genre.all
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    @artist = Artist.find(params[:artist_id])

    @album.artist = @artist

    if @album.save
      redirect_to artist_album_path(@artist, @album.id)
    else
      @album.errors.full_messages.each do |msg|
        flash[:error] = msg
      end
      render 'new'
    end
  end

  def edit
    @genres = Genre.all
    @artist = Artist.find(params[:artist_id])
    @album = Album.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:artist_id])
    @album = Album.find(params[:id])

    if @album.update(album_params)
      redirect_to artist_albums_path(@artist)
    else
      render 'edit'
    end
  end

  def destroy
    artist = Artist.find(params[:artist_id])
    album = Album.find(params[:id])

    album.destroy

    redirect_to artist_albums_path(artist)
  end

  private
  def album_params
    params.require(:album).permit(:name, :genre_id, :artist_id)
  end
end
