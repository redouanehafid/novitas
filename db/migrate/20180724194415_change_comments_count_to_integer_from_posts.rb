class ChangeCommentsCountToIntegerFromPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :comments_count, :integer, default: 0
  end
end
