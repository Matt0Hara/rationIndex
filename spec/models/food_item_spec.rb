require "rails_helper"
require "shoulda-matchers"
require "valid_attribute"

RSpec.describe FoodItem, type: :model do
  subject { FactoryGirl.create(:food_item) }
  it { should belong_to(:food_store) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :food_store_id }
  let(:food_store) { FactoryGirl.create(:food_store) }
end
