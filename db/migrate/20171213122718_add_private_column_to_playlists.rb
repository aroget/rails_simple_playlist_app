class AddPrivateColumnToPlaylists < ActiveRecord::Migration[5.1]
  def change
    add_column :playlists, :public, :boolean, :default => true
  end
end
