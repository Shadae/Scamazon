class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :first_name
      t.string :last_name
      t.string :email_address
      t.string :address1
      t.string :address2
      t.string :city
      t.string :zip
      t.string :billing_first
      t.string :billing_last
      t.string :credit_card_number
      t.integer :cvv
      t.string :billing_zip
      t.string :billing_address1
      t.string :billing_address2
      t.string :billing_city

      t.timestamps
    end
  end
end
