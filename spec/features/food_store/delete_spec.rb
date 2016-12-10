require "rails_helper"
include LoginHelper
feature "user deletes a food store", %{
  As an authenticated user
  I want to delete a food store
  so that I can keep my food stores organized
} do
  scenario "authenticated user deletes a food store" do
    food_store = FactoryGirl.create(:food_store)
    login(food_store.user)
    click_link("FoodStore")
    expect(page).to have_link(food_store.name)
    click_button("Delete")
    expect(page).to_not have_content(food_store.name)
  end
end
