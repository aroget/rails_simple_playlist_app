class CreatePlaylists < ActiveRecord::Migration[5.1]
  def change
    create_table :playlists do |t|
      t.string :name
      t.integer :likes

      t.timestamps
    end

    add_column :songs, :playlist_id, :integer, foreign_key: true
  end
end
