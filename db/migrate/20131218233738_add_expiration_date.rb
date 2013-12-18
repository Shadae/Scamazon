class AddExpirationDate < ActiveRecord::Migration
  def change
    add_column :purchases, :expiration_date, :int
  end
end
