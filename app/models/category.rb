class Category < ActiveRecord::Base
  #set_table_name "cms_categories"

  has_many :articles
  belongs_to :author, :class_name => 'User', :foreign_key => 'user_id'
  belongs_to :parent, :class_name => 'Category', :foreign_key => 'parent_id'
  
  has_many :category_moderators, :class_name => 'CategoryModerator', :foreign_key => 'category_id'
#  has_many :moderators, :class_name => "User", :through => :category_moderators
  
  
  scope :live, :where => "deleted_at is NULL"
  attr_accessible :name, :permalink, :user_id, :created_at, :updated_at, :is_blog, :parent_id
  scope :blog, :conditions => ["is_blog = ?", true]
  
  
  attr_accessible :name, :permalink, :user_id, :created_at, :updated_at
  validates :name, :presence => true
  validates :permalink, :presence => true, :uniqueness => true

  before_validation do
  # TODO: ensure this is unique
    self.permalink = name.parameterize rescue nil
  end

  def updatable_by?(check_user)
  return true if self.moderators.include?(check_user)
  return parent && parent.updatable_by?(check_user)
  end
  
  def moderators
    category_moderators.map{|category_moderator| category_moderator.user}
  end
  

end
