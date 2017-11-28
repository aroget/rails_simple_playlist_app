class RemoveRelationshipPlaylist < ActiveRecord::Migration[5.1]
  def change
    remove_column :songs, :playlist_id
  end
end
