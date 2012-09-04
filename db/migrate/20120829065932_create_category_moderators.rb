class CreateCategoryModerators < ActiveRecord::Migration
  def self.up
    create_table :category_moderators do |t|
      t.integer :category_id
      t.integer :moderator_id
      t.timestamps
    end
  end

  def self.down
    drop_table :category_moderators
  end
end
