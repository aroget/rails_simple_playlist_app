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

    if @artist.update(artist_params)
      redirect_to @artist
    else
      render 'edit'
    end
  end

  def create
    @artist = Artist.new(artist_params)
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
