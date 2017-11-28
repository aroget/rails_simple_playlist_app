class AddGenreRelation < ActiveRecord::Migration[5.1]
  def change
    add_column :albums, :genre_id, :integer
  end
end
