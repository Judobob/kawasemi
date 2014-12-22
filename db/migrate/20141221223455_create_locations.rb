class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :description
      t.string :address_1
      t.string :adddress_2
      t.string :city
      t.string :county
      t.string :postcode
      t.integer :country_id
      t.string :telephone
      t.string :website
      t.string :email

      t.timestamps
    end
  end
end
