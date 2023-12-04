class CreateFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :measurementunit
      t.decimal :price
      t.integer :quantity
      t.references :user_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
