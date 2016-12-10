require "rails_helper"
include LoginHelper
feature "user deletes a food item", %{
  As an authenticated user
  I want to delete food items
  so that I can keep track of my food
} do
  scenario "authenticated user deletes food item" do
    food_item = FactoryGirl.create(:food_item)
    login(food_item.food_store.user)
    visit food_store_path(food_item.food_store)
    expect(page).to have_content(food_item.name)
    click_button "Delete"
    expect(page).to_not have_content(food_item.name)
  end
end
