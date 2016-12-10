require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :food_item do
    sequence(:name) { |n| "Item #{n}" }
    # .strftime("%d/%m/%y")
    entry_date Time.now
    expiration_date Time.now + 40_000
    food_store
  end

  factory :food_store do
    sequence(:name) { |n| "FoodStore#{n}" }
    user
  end
end
