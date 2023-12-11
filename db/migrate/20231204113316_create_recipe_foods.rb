class CreateRecipeFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :recipe_foods do |t|
      t.integer :quantity
      t.references :recipe, null: false, foreign_key: { to_table: :recipes, column: :recipe_id }
      t.references :food, null: false, foreign_key: { to_table: :foods, column: :food_id }

      t.timestamps
    end
  end
end
