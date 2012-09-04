class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string  :title
      t.string  :permalink
      t.string  :description
      t.string  :content
      t.integer :user_id
      t.string  :status        , :limit => 8
      t.integer :category_id
      t.string  :location
      t.timestamps
    end
  end
end
