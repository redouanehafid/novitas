class AddAttributesToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :firstname, :string
    add_column :orders, :lastname, :string
    add_column :orders, :adresse, :string
    add_column :orders, :tel, :string
  end
end
