class CreateApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :applications do |t|
      t.belongs_to :collaboration
      t.belongs_to :user
      t.timestamps
    end
  end
end
