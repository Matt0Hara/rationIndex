class FoodStore < ActiveRecord::Base
  belongs_to :user
  has_many :food_items
  validates :name, presence: true
  validates :user_id, presence: true
end
