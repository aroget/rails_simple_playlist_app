class AddGenreRelationship < ActiveRecord::Migration[5.1]
  def change
    add_column :genres, :album_id, :integer
  end
end
