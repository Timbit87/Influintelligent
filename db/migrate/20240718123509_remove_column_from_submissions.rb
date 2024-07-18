class RemoveColumnFromSubmissions < ActiveRecord::Migration[7.1]
  def change
    remove_column :submissions, :collaboration_id, :bigint
  end
end
