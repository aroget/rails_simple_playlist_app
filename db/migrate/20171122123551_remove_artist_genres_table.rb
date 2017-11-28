class RemoveArtistGenresTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :artists_genres
  end
end
