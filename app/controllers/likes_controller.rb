class LikesController < ApplicationController
  def destroy
    @playlist = Playlist.find(params[:playlist_id])
    like = Like.find_by(:user_id => current_user.id, :playlist_id => @playlist.id)

    redirect_to playlists_path if like.nil?

    like.destroy

    redirect_to playlists_path
  end

  def create
    @playlist = Playlist.find(params[:playlist_id])
    @like = Like.new(:playlist_id => params[:playlist_id], :user_id => current_user.id)

    if @like.save
      redirect_to playlists_path
    else
      @like.errors.full_messages do |msg|
        flash[:danger] = msg
      end
      render 'index'
    end
  end
end
