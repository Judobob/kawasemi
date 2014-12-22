class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.string :first_name
      t.string :second_name
      t.string :address_1
      t.string :adddress_2
      t.string :city
      t.string :county
      t.string :postcode
      t.integer :country_id
      t.string :telephone
      t.string :email

      t.timestamps
    end
  end
end
