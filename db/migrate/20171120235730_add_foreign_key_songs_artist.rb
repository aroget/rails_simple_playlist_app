class AddForeignKeySongsArtist < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :artist_id, :bigint, foregin_key: true
  end
end
