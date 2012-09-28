class Setting < ActiveRecord::Base
   has_attached_file :logo, 
                    :styles => {
                    :thumb => "40x40>"}, 
                    :default_url =>'/images/logo_default.png'
  
   attr_accessible :title, :about_us, :website, :web_name, :email, :logo
   
  
    
end
