require "rails_helper"
require "shoulda-matchers"
require "valid_attribute"

RSpec.describe FoodStore, type: :model do
  subject { FactoryGirl.create(:food_store) }
  it { should belong_to(:user) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :user_id }
  let(:user) { FactoryGirl.create(:user) }
end
