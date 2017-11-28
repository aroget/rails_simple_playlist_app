class AddJoinTableGenresArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists_genres, id: false do |t|
      t.belongs_to :artist, index:true
      t.belongs_to :genre, index: true
    end
  end
end
