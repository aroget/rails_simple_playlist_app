class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.bigint :playlist_id
      t.bigint :user_id

      t.timestamps
    end

    add_foreign_key :likes, :playlists
    add_foreign_key :likes, :users
  end
end
