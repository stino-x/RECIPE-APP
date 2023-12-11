class Inventory < ApplicationRecord # rubocop:disable Layout/EndOfLine
  belongs_to :user
  has_many :inventory_foods
end
