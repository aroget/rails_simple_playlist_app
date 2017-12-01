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
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    @artist = Artist.find(params[:artist_id])
    @album.artist = Artist.find(params[:artist_id])

    if album_params[:cover_image]
      cover_image = Cloudinary::Uploader.upload(album_params[:cover_image])['secure_url']
      @album.cover_image = cover_image
    end

    if @album.save
      redirect_to artist_album_path(@artist, @album.id)
    else
      @album.errors.full_messages.each do |msg|
        flash[:error] = msg
        puts msg
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

    # in order to override the
    # hash we store it in a new variable
    form_values = album_params

    if form_values[:cover_image]
      cover_image = Cloudinary::Uploader.upload(form_values[:cover_image])['secure_url']
      form_values[:cover_image] = cover_image
    end

    if @album.update(form_values)
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
    params.require(:album).permit(:name, :genre_id, :artist_id, :cover_image)
  end
end
