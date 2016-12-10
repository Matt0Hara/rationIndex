class AddFoodStores < ActiveRecord::Migration
  def change
    create_table :food_stores do |t|
      t.string :name, null: false
      t.belongs_to :user, null: false
    end
  end
end
