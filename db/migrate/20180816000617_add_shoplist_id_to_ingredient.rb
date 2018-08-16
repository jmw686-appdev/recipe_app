class AddShoplistIdToIngredient < ActiveRecord::Migration[5.2]
  def change
    add_column :ingredients, :shoplist_id, :string
  end
end
