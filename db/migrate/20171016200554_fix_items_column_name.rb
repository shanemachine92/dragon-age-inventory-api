class FixItemsColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :items, :class, :wielder
  end
end
