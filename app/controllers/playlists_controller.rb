class PlaylistsController < ApplicationController
  def index
    @playlists = if params['author'] then get_all_playlists(params['author']) else get_all_playlists end
  end

  def show
    playlist = Playlist.find(params[:id])

    if !playlist.public
      redirect_to playlists_path if not_owner(playlist)
    end

    @playlist = playlist
  end

  def new
    @playlist = Playlist.new

    if !logged_in?
      flash[:warning] = 'Please login...'
      redirect_to playlists_path
    end
  end

  def create
    @playlist = Playlist.new(:name => playlist_parms[:name],
                             :user_id => current_user.id,
                             :public => playlist_parms[:public])

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

    if @playlist.update(:name => playlist_parms[:name],
                        :user_id => current_user.id,
                        :public => playlist_parms[:public])
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
    params.require(:playlist).permit(:name, :public)
  end

  def get_all_playlists(user_id = nil)
    if user_id === nil
      Playlist.all.where(:public => true)
    else
      if user_id.to_i == current_user.id.to_i
        Playlist.all.where(:user_id => user_id)
      else
        Playlist.all.where(:public => true, :user_id => user_id)
      end
    end
  end
end
