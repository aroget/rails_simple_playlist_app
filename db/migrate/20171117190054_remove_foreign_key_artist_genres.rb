class RemoveForeignKeyArtistGenres < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :artists, :genres
    remove_column :artists, :genre_id
  end
end
