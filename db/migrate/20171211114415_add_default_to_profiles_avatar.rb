class AddDefaultToProfilesAvatar < ActiveRecord::Migration[5.1]
  def change
    change_column :profiles, :avatar, :string, :default => "https://www.placehold.it/120x120"
  end
end
