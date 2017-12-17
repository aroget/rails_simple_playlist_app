class RemovePlaylistId < ActiveRecord::Migration[5.1]
  def change
    remove_column :tags, :playlist_id
  end
end
