class Article < ActiveRecord::Base
  #set_table_name "cms_articles"

  #has_paper_trail
  belongs_to :category
  belongs_to :author, :class_name => 'User', :foreign_key => 'user_id'
  belongs_to :user
  has_many :comments, :as => :commentable
  has_many :versions
  has_many :images
  attr_accessible :is_public, :is_featured, :deleted_by, :title, :permalink, :description, :content, :user_id, :status, :category_id, :location, :created_at, :updated_at

  def default_image
    return @default_image if @default_image
    @default_image = images.public_img.where(:is_main => true).first
    @default_image = images.public_img.first unless @default_image
    @default_image = images.new unless @default_image
    return @default_image 
  end
  

  #validates_attachment_presence :photo
  #validates_attachment_size :photo, :less_than => 5.megabytes
  #validates_attachment_content_type :photo, :content_type => ['image/jpg','image/png','image/jpeg']

  scope :live, lambda { where("deleted_by is NULL") }
  scope :public, :conditions => ["is_public = ?", true]
  scope :featured, :conditions => ["is_featured = ?", true]
  

  before_validation do
  # TODO: ensure this is unique
    self.permalink = title.parameterize rescue nil
  end
  
  def updatable_by? (check_user)
    return false unless check_user
    return true if check_user.admin? || check_user == self.author 
    return category && category.updatable_by?(check_user)
  end
  
  def related_articles
    return [] unless self.category_id
    return Article.live.public.where(:category_id => self.category_id).order("updated_at DESC").limit(10)
  end

end

