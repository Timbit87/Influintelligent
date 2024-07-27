class ChangeWebsitesToWebsites < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :websites
    add_column :users, :website, :string
  end
end
