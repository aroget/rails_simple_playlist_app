class RemoveAlbumIdFromGenre < ActiveRecord::Migration[5.1]
  def change
    remove_column :genres, :album_id
  end
end
