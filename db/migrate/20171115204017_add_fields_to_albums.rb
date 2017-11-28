class AddFieldsToAlbums < ActiveRecord::Migration[5.1]
  def change
    add_column :albums, :cover_image, :string
    add_column :albums, :release_date, :date
  end
end
