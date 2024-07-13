class RenameApplicationsToSubmissions < ActiveRecord::Migration[7.1]
  def change
    rename_table :applications, :submissions
  end
end
