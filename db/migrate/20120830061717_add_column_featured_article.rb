class AddColumnFeaturedArticle < ActiveRecord::Migration
  def up
    add_column :articles, :is_featured, :boolean, :default => false
  end

  def down
    remove_column :articles, :is_featured
  end
end
