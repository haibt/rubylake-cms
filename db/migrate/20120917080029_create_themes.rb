class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :color_title_article
      t.string :color_backgrond_body
      t.string :color_backgrond_menu
      t.string :color_title_menu
      t.timestamps
    end
  end
end
