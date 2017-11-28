class ForeignKeySongsArtist < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :songs, :artists
  end
end
