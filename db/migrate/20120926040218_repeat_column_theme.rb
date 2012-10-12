class RepeatColumnTheme < ActiveRecord::Migration
  def up
    remove_column :themes, :color_background_menu
    remove_column :themes, :color_background_body
    remove_column :themes, :color_background_article
    remove_column :themes, :is_active
    add_column :themes, :color_background_menu,:string, :default => "#e4e4e4"
    add_column :themes, :color_background_body,:string, :default => "#e4e4e4"
    add_column :themes, :color_background_article,:string, :default => "#e4e4e4"
     add_column :themes, :is_active,:boolean, :default => true
  end

  def down
    remove_column :themes, :color_background_menu
    remove_column :themes, :color_background_body
    remove_column :themes, :color_background_article
    remove_column :themes, :is_active
  end
end
