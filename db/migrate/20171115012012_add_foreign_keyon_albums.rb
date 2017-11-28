class AddForeignKeyonAlbums < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :albums, :artists
  end
end
