class CreateInventories < ActiveRecord::Migration[7.1]
  def change
    create_table :inventories do |t|
      t.string :name
      t.text :description  # Corrected line
      t.references :user, null: false, foreign_key: { to_table: :users, column: :user_id }

      t.timestamps
    end
  end
end
