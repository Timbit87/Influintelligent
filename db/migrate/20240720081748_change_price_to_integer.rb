class ChangePriceToInteger < ActiveRecord::Migration[7.1]
  def change
    change_column :collaborations, :price, :integer
  end
end
