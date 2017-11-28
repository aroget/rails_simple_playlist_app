class AddForeignKeyArtistGenres < ActiveRecord::Migration[5.1]
  def change
    change_column :artists, :genre_id, :bigint
    add_foreign_key :artists, :genres
  end
end
