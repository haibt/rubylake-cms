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
  scope :public_img, :conditions => ["is_public = ?", false]
  def self.save(image) 
  end
 
end
