class AddForeignKeyToJoinTable < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :playlists_songs, :playlists
    add_foreign_key :playlists_songs, :songs

    change_column :playlists, :likes, :integer, :default => 0
  end
end
