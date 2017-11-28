class RemoveForeignKeyAlbumsArtist < ActiveRecord::Migration[5.1]
  def change
    add_column :artists, :genre_id, :integer, foreign_key: true
  end
end
