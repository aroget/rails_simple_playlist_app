class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :country
      t.string :bio
      t.string :avatar

      t.timestamps
    end
  end
end
