class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.all
  end

  def show
    @playlist = Playlist.find(params[:id])
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new(playlist_parms)

    if @playlist.save
      redirect_to playlist_path(@playlist)
    else
      render 'new'
    end
  end

  def edit
    @playlist = Playlist.find(params[:id])
  end

  def update
    @playlist = Playlist.find(params[:id])

    if @playlist.update(playlist_parms)
      redirect_to playlist_path(@playlist)
    else
      render 'edit'
    end
  end

  def destroy
    @playlist = Playlist.find(params[:id])

    @playlist.destroy
    redirect_to playlists_path
  end

  def playlist_songs
    @playlist = Playlist.find(params[:id])
    song_ids = @playlist.songs.select('id')

    @songs = Song.where.not(id: song_ids)
  end

  def new_playlist_song
    @playlist = Playlist.find(params[:id])
    @song = Song.find(params[:song_id])

    @playlist.songs.append(@song)

    redirect_to playlist_songs_new_path(@playlist)
  end

  def destroy_playlist_song
    @playlist = Playlist.find(params[:id])
    @song = Song.find(params[:song_id])

    @playlist.songs.delete(@song)

    redirect_to playlist_songs_new_path(@playlist)
  end

  private
  def playlist_parms
    params.require(:playlist).permit(:name)
  end
end
