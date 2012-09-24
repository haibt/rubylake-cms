class RemoveColumnColortitleOnTheme < ActiveRecord::Migration
  def up
    remove_column :themes ,:color_title_article
    remove_column :themes ,:color_title_menu
  end

  def down
     add_column :themes, :color_title_article, :string
    add_column :themes, :color_title_menu, :string
  end
end
