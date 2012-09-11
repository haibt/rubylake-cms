class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :article_id
      t.boolean :is_main ,:default => false
      t.boolean :is_public,:default => false
      
    end
  end
end
