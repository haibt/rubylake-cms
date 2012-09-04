class CreateVersions < ActiveRecord::Migration
  def self.up
    create_table :versions do |t|
      t.string   :article_type
      t.integer  :article_id
      t.string   :event
      t.string   :whodunnit
      t.text     :object
      t.datetime :created_at
    end
    add_index :versions, [:article_type, :article_id]
  end

  def self.down
    remove_index :versions, [:article_type, :article_id]
    drop_table :versions
  end
end
