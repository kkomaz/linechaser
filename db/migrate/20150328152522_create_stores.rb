class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.integer :rating
      t.integer :zipcode
      t.timestamps null: false
    end
  end
end
