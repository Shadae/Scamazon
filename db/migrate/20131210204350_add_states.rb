class AddStates < ActiveRecord::Migration
  def change
    add_column :purchases, :state, :string
    add_column :purchases, :billing_state, :string
  end
end
