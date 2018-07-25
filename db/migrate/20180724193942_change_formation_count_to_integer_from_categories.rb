class ChangeFormationCountToIntegerFromCategories < ActiveRecord::Migration[5.2]
  def change
    change_column :categories, :formations_count, :integer, default: 0
  end
end
