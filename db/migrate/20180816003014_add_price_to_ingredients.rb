class AddPriceToIngredients < ActiveRecord::Migration[5.2]
  def change
    add_column :ingredients, :price, :float
  end
end
