class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :preparationtime
      t.integer :cookingtime
      t.text :description
      t.boolean :public
      t.references :user_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
