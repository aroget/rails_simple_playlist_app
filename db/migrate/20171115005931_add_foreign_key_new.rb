class AddForeignKeyNew < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :albums, :genres
  end
end
