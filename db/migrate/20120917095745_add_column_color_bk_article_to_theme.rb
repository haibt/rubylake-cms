class AddColumnColorBkArticleToTheme < ActiveRecord::Migration
  def up
    add_column :themes, :color_background_article, :string
  end

  def down
    remove_column :themes, :color_background_article
  end
end
