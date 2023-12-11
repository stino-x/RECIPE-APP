class CreateFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :measurementunit
      t.decimal :price
      t.integer :quantity
      t.references :user, null: false, foreign_key: { to_table: :users, column: :user_ids }

      t.timestamps
    end
  end
end
