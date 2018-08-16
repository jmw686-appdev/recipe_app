class RemoveAmountUnitsFromShoplist < ActiveRecord::Migration[5.2]
  def change
    remove_column :shoplists, :amount, :integer
    remove_column :shoplists, :units, :string
  end
end
