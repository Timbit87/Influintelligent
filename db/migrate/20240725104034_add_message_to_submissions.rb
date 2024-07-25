class AddMessageToSubmissions < ActiveRecord::Migration[7.1]
  def change
    add_column :submissions, :message, :text
  end
end
