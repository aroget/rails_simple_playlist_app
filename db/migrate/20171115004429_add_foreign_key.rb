class AddForeignKey < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :albums, :genres, column: :id
  end
end
