class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
    @genres = @artist.genres
    @albums = @artist.albums
    @songs = @artist.songs.limit(5)
  end

  def update
    @artist = Artist.find(params[:id])

    # in order to override the
    # hash we store it in a new variable
    form_values = artist_params

    if form_values[:avatar_url]
      avatar_url = Cloudinary::Uploader.upload(form_values[:avatar_url])['secure_url']
      form_values[:avatar_url] = avatar_url
    end

    if @artist.update(form_values)
      redirect_to @artist
    else
      render 'edit'
    end
  end

  def create
    @artist = Artist.new(artist_params)

    if artist_params[:avatar_url]
      avatar_url = Cloudinary::Uploader.upload(artist_params[:avatar_url])['secure_url']
      @artist.avatar_url = avatar_url
    end

    if @artist.save
      redirect_to @artist
    else
      @artist.errors.full_messages.each do |msg|
        flash[:error] = msg
      end

      redirect_to new_artist_path
    end
  end

  def new
    @artist = Artist.new
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy

    redirect_to artists_path
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  private
  def artist_params
    params.require(:artist).permit(:name, :bio, :country,
                                   :formed_in, :is_touring, :avatar_url)
  end
end
