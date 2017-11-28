class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :name
      t.belongs_to :album, index: true
      t.timestamps
    end
  end
end
