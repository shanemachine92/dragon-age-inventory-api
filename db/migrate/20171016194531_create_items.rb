class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :wielder
      t.integer :level
      t.references :inventory, foreign_key: true

      t.timestamps
    end
  end
end
