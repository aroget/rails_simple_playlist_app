class CreatePlaylistsLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :playlists_likes, id: false do |t|
      t.belongs_to :playlist, index: true
      t.belongs_to :user, index: true
    end
  end
end
