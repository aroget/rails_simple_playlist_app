class DropPlaylistsTags < ActiveRecord::Migration[5.1]
  def change
    drop_table :playlists_tags
    add_column :playlists, :tag_id, :bigint
  end
end
