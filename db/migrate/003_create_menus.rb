class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string  :name
      t.string  :permalink
      t.integer :parent_id
      t.string  :location       , :limit => 8
      t.string  :extra_link
      t.integer :category_id
      t.integer :article_id

      t.timestamps
    end
  end
end
