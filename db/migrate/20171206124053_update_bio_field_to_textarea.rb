class UpdateBioFieldToTextarea < ActiveRecord::Migration[5.1]
  def change
    change_column :profiles, :bio, :text
  end
end
