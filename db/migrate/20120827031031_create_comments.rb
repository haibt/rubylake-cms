class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment
      t.integer :commentable_id
      t.string   :commentable_type
      t.integer  :user_id
      t.integer :article_id
      t.timestamps
    end
  end
end
