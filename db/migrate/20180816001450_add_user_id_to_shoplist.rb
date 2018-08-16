class AddUserIdToShoplist < ActiveRecord::Migration[5.2]
  def change
    add_column :shoplists, :user_id, :string
  end
end
