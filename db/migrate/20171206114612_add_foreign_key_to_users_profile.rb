class AddForeignKeyToUsersProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :profile_id, :bigint
    add_foreign_key :users, :profiles
  end
end
