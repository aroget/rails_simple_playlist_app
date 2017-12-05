class AddUserForeignKeyToPlaylists < ActiveRecord::Migration[5.1]
  def change
    add_column :playlists, :user_id, :bigint
    add_foreign_key :playlists, :users
  end
end
