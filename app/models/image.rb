class Image < ActiveRecord::Base
  # attr_accessible :title, :body
   belongs_to :article
  attr_accessible :article_id, :is_main, :is_public,:photo, :title, :description

  has_attached_file :photo, 
                    :styles => {
                    :thumb => "250x250>", 
                    :medium => "400x400>"}, 
                    :default_url => '/images/member_default_thumb.jpg'
  scope :main, :conditions => ["is_main = ?", true]  
  scope :public_img, :conditions => ["is_public = ?", true]
  def self.save(image) 
  
  end

  # def upload_by? (check_user)
    # return false unless check_user
    # return true if check_user.admin? || check_user == self.author 
    # return image && image.updatable_by?(check_user)
  # end
end