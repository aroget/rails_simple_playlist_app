class AddFieldsToArtist < ActiveRecord::Migration[5.1]
  def change

    add_column :artists, :formed_in, :date
    add_column :artists, :is_touring, :boolean, :default => false
  end
end
