class AddUserIdToRecipe < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :user_id, :string
  end
end
