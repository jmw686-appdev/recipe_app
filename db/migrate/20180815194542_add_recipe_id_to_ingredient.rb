class AddRecipeIdToIngredient < ActiveRecord::Migration[5.2]
  def change
    add_column :ingredients, :recipe_id, :string
  end
end
