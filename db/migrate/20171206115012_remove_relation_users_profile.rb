class RemoveRelationUsersProfile < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :users, :profiles
    remove_column :users, :profile_id
  end
end
