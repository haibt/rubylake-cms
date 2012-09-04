class AddColumnPublicArticle < ActiveRecord::Migration
  def up
    add_column :articles, :is_public, :boolean, :default => false
  end

  def down
    remove_column :articles, :is_public
  end
end
