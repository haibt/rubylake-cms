class RemoveArticlePhoto < ActiveRecord::Migration
  def up
    drop_attached_file :articles, :photo
    remove_column :articles,:img
    change_table :images do |t|
      t.has_attached_file :photo
    end
  end

  def down
   drop_attached_file :images, :photo
   add_column :articles,:img,:string
  end
end
