# db/migrate/202312041XXX_create_inventory_foods.rb (replace XXX with your specific timestamp)
class CreateInventoryFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :inventory_foods do |t|
      t.integer :quantity
      t.references :inventory, null: false, foreign_key: { to_table: :inventories, column: :inventory_id }
      t.references :food, null: false, foreign_key: { to_table: :foods, column: :food_id }

      t.timestamps
    end
  end
end
