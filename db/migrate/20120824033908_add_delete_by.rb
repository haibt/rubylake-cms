class AddDeleteBy < ActiveRecord::Migration
  def up
    add_column :articles, :deleted_by, :integer, :default => nil
  end

  def down
    remove_column :articles ,:deleted_by
  end
end
