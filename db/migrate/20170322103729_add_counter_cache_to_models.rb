class AddCounterCacheToModels < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :posts_count, :integer, default: 0
    add_column :users, :comments_count, :integer, default: 0
    add_column :posts, :comments_count, :integer, default: 0
  end
end
