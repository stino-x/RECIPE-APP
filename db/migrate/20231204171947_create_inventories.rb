class CreateInventories < ActiveRecord::Migration[7.1]
  def change
    create_table :inventories do |t|
      t.string :name
      t.references :user, null: false, foreign_key: { to_table: :users, column: :user_ids }

      t.timestamps
    end
  end
end
