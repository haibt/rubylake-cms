class Theme < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :color_background_body, :is_active, :color_background_menu, :img_bg,:color_background,:color_title_article, :color_title_menu, :color_background_article
  
  attr_accessible :img_bg
  has_attached_file :img_bg, :default_url => '/images/anhdep.jpg'
  after_save :inactive_other_themes
  
  scope :active, :conditions => ["is_active = ?", true]  
  def inactive_other_themes
    #kiem tra trang thai cua Theme hien tai la active khong, neu dang active thi thuc hien tiep
    #neu no la trang thai active, tim cac record khac co trang thai la active, roi thay doi lai trang thai cua chung ve dang inactive
    @theme = Theme.order("updated_at DESC").limit(1)
    @theme.each do|theme|
      if theme.is_active == true
       Theme.active.each do |themes|
          unless themes.id == theme.id
         themes.update_attribute(:is_active, false)
          end
       end
     end
   end
  end
  
  
  
end
