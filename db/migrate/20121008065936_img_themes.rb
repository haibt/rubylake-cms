class ImgThemes < ActiveRecord::Migration
  def up
    remove_column :Themes, :color_background_menu
    remove_column :Images, :is_public
    add_column :Themes, :color_background_menu, :string
    add_column :Images, :is_public, :boolean, :default => true
  end

  def down
    remove_column :Themes, :color_background_menu
    remove_column :Images, :is_public
  end
end
