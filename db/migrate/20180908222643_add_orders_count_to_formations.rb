class AddOrdersCountToFormations < ActiveRecord::Migration[5.2]
  def change
    add_column :formations, :orders_count, :integer, default: 0
  end
end
