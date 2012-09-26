class AddColumnActiveToTheme < ActiveRecord::Migration
  def up
    add_column :themes, :is_active, :boolean, :default => false
  end

  def down
    remove_column :themes, :is_active
  end
end
