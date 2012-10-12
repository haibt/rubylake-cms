class AddColumnSettings < ActiveRecord::Migration
  def up
     add_column :settings, :website, :string, :default => "www.ithanoi.com"
     add_column :settings, :email, :string, :default => "scrum2B@ithanoi.com"
     add_column :settings, :web_name, :string, :default => "Scrum2B team"
     remove_column :settings, :ten_web
     remove_column :settings,:title
     add_column :settings, :title,:string, :default => "Scrum2B: be scrum with us"

  end

  def down
    remove_column :settings, :website
    remove_column :settings, :email
    remove_column :settings, :web_name
    remove_column :settings,:title
  end
end
