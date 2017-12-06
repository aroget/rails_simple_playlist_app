class AddForeignKeyToProfilesUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :user_id, :bigint
    add_foreign_key :profiles, :users
  end
end
