class AddFoodItems < ActiveRecord::Migration
  def change
    create_table :food_items do |t|
      t.string :name, null: false
      t.date :expiration_date
      t.date :entry_date
      t.string :place
      t.belongs_to :food_store
    end
  end
end
