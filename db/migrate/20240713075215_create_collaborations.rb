class CreateCollaborations < ActiveRecord::Migration[7.1]
  def change
    create_table :collaborations do |t|
      t.string :title
      t.text :description
      t.float :price
      t.string :category, array: true
      t.date :start_date
      t.date :end_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
