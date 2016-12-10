class FoodItem < ActiveRecord::Base
  belongs_to :food_store
  validates :name, presence: true
  validates :food_store_id, presence: true
end
