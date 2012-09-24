class DeleteTableTheme < ActiveRecord::Migration
  def up
    drop_table :themes 
    create_table :themes do |t|
      t.string :color_title_article
      t.string :color_background_body
      t.string :color_background_menu
      t.string :color_title_menu
      t.timestamps
    end
  end

  def down
    drop_table :themes
  end
end
