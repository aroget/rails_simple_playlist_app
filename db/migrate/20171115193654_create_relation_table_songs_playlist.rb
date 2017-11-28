class CreateRelationTableSongsPlaylist < ActiveRecord::Migration[5.1]
  def change
    create_table :playlists_songs, id: false do |t|
      t.belongs_to :playlist, index: true
      t.belongs_to :song, index: true
    end
  end
end
