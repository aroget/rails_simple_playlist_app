class SetIdToBigInt < ActiveRecord::Migration[5.1]
  def change
    change_column :albums, :genre_id, :bigint
  end
end
