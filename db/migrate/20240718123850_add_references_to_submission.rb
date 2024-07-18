class AddReferencesToSubmission < ActiveRecord::Migration[7.1]
  def change
    add_reference :submissions, :collaboration, null: false, foreign_key: true
  end
end
