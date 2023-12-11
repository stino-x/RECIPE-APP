class InventoryFood < ApplicationRecord
  belongs_to :inventory_id
  belongs_to :food_id
end
