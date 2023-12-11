class InventoryFood < ApplicationRecord # rubocop:disable Layout/EndOfLine
  belongs_to :inventory
  belongs_to :food
end
