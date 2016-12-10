require "rails_helper"
include LoginHelper
feature "user views food_stores", %{
  As an authenticated user
  I want to view my food_stores
  so that I can keep track of my food
} do
  scenario "unauthenticated user attempts to view food stores" do
    food_store = FactoryGirl.create(:food_store)
    visit food_stores_path
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
    expect(page).to_not have_content(food_store.name)
  end

  scenario "authenticated user views food_stores" do
    food_store = FactoryGirl.create(:food_store)
    login(food_store.user)
    visit food_stores_path
    expect(page).to have_link(food_store.name)
  end
end
