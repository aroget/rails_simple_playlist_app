class CreateJoinTablePlaylistsTags < ActiveRecord::Migration[5.1]
  def change
    create_join_table :playlists, :tags
  end
end
