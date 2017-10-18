class AddReferenceToUserToInventory < ActiveRecord::Migration[5.1]
  def change
    add_reference :inventories, :users, foreign_key: true
  end
end
