class AddImgArticle < ActiveRecord::Migration
  def up
  end
  add_column :articles ,:img,:string
  def down
    remove_column :articles ,:img 
  end
end
