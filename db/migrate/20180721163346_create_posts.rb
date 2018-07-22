class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :comments_count
      t.boolean :online

      t.timestamps
    end
  end
end
