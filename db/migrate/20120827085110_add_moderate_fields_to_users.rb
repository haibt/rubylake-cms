class AddModerateFieldsToUsers < ActiveRecord::Migration
  def up
    add_column :users, :is_moderate, :boolean
  end

  def down
     remove_column :users, :is_moderate
  end
end
