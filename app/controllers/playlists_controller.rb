class PlaylistsController < ApplicationController
  def index
    @playlists = if params['author'] then Playlist.where(user_id: params['author']) else Playlist.all end
  end

  def show
    @playlist = Playlist.find(params[:id])
  end

  def new
    @playlist = Playlist.new

    if !logged_in?
      flash[:warning] = 'Please login...'
      redirect_to playlists_path
    end
  end

  def create
    @playlist = Playlist.new(:name => playlist_parms[:name], :user_id => current_user.id)

    if @playlist.save
      redirect_to playlist_path(@playlist)
    else
      @playlist.errors.full_messages.each do |msg|
        flash.now[:danger] = msg
      end
      render 'new'
    end
  end

  def edit
    @playlist = Playlist.find(params[:id])

    if !logged_in? || !is_owner(@playlist.user_id)
      redirect_to playlists_path
    end
  end

  def update
    @playlist = Playlist.find(params[:id])

    if @playlist.update(:name => playlist_parms[:name], :user_id => current_user.id)
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
