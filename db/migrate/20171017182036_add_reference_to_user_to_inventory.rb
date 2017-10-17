class AddReferenceToUserToInventory < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :inventories, :users
  end
end
