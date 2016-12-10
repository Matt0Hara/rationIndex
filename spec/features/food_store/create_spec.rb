require "rails_helper"
include LoginHelper
feature "user creates a food store", %{
  As an authenticated user
  I want to create a food_store
  so that I can keep my food organized
} do
  scenario "authenticated user creates a food store" do
    login(FactoryGirl.create(:user))
    name = SecureRandom.hex.to_s
    click_link("Food")
    expect(page).to have_link("Add a storage unit")
    click_link("Add a storage unit")
    within "div#storeNew" do
      fill_in "Name", with: name
      click_button("Create")
    end
    expect(page).to have_content(name)
  end
end
