class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :preparationtime
      t.integer :cookingtime
      t.text :description
      t.boolean :public
      t.references :user, null: false, foreign_key: { to_table: :users, column: :user_ids }

      t.timestamps
    end
  end
end
