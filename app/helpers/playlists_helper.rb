module PlaylistsHelper
  def is_owner(user_id)
    current_user.id == user_id
  end

  def user_liked?(playlist_id, user_id)
    Like.find_by(:playlist_id => playlist_id, :user_id => user_id) != nil
  end

  def like_id(playlist_id)
    Like.find_by(:playlist_id => playlist_id, :user_id => current_user.id)
  end

  def not_owner(playlist)
    playlist.user_id.to_i != current_user.id.to_i
  end
end
