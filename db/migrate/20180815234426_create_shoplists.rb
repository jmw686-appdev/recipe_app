class CreateShoplists < ActiveRecord::Migration[5.2]
  def change
    create_table :shoplists do |t|
      t.string :name
      t.integer :amount
      t.string :units
      t.float :sum
      t.integer :recipe_id

      t.timestamps
    end
  end
end
