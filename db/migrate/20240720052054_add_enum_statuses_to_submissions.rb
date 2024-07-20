class AddEnumStatusesToSubmissions < ActiveRecord::Migration[7.1]
  def change
    add_column :submissions, :status, :integer, default: 0
  end
end
