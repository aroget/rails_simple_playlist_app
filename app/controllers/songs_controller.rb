class SongsController < ApplicationController
  def index
    @artist = Artist.find(params[:artist_id])
    @songs = @artist.songs

  end

  def show
    @artist = Artist.find(params[:artist_id])
    @album = Album.find(params[:album_id])
    @song = Song.find(params[:id])
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @album = Album.find(params[:album_id])
    @song = Song.new(song_params)
    @song.artist = @artist
    @song.album_id = params[:album_id]

    if @song.save
      redirect_to artist_album_path(@artist, @album.id)
    else
      @song.errors.full_message do |error|
        flash[:error] = error
      end
      render 'new'
    end
  end

  def new
    @artist = Artist.find(params[:artist_id])
    @album = Album.find(params[:album_id])
    @song = Song.new
  end

  def edit
    @artist = Artist.find(params[:artist_id])
    @album = Album.find(params[:album_id])
    @song = Song.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:artist_id])
    @album = Album.find(params[:album_id])
    @song = Song.find(params[:id])

    if @song.update(song_params)
      redirect_to artist_album_path(@artist, @album.id)
    else
      render 'edit'
    end
  end

  def destroy
    @artist = Artist.find(params[:artist_id])
    @album = Album.find(params[:album_id])
    @song = Song.find(params[:id])

    @song.destroy

    redirect_to artist_album_path(@artist, @album)
  end

  private
  def song_params
    params.require(:song).permit(:name)
  end
end
