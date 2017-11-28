class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.string :name

      t.timestamps
    end

    add_column :albums, :artist_id, :bigint
  end
end
