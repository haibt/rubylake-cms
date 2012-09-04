class Menu < ActiveRecord::Base
  #set_table_name "cms_menus"

  belongs_to :article
  belongs_to :category

  belongs_to :parent_menu, :class_name => 'Menu', :foreign_key => 'parent_id'
  has_many   :sub_menues, :class_name => 'Menu', :foreign_key => 'parent_id'

  scope :main, lambda { where(:location => 'main') }

  attr_accessible :name, :deleted_by, :title, :permalink, :description, :content, :user_id, :extra_link,
                  :status, :category_id, :location, :created_at, :updated_at, :parent_id, :article_id

end
