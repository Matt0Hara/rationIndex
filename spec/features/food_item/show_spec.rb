require "rails_helper"
include LoginHelper
feature "user views a food store", %{
  As an authenticated user
  I want to view a food store
  so that I can keep track of my food
} do
  scenario "unauthenticated user attempts to view a food store" do
    food_store = FactoryGirl.create(:food_store)
    visit food_stores_path
    expect(page).to_not have_link("Food")
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
    expect(page).to_not have_content(food_store.name)
  end

  scenario "authenticated user views a food_store" do
    food_store = FactoryGirl.create(:food_store)
    login(food_store.user)
    click_link("Food")
    click_link(food_store.name.to_s)
    expect(page).to_not have_content("Email")
    expect(page).to_not have_content("Password")
    expect(page).to have_content(food_store.name)
  end
end
