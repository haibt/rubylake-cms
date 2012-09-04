class AddCategoryBlog < ActiveRecord::Migration
  def up
  add_column :categories, :is_blog, :boolean, :default => false
  end

  def down
  remove_column :categories, :is_blog
  end
end
