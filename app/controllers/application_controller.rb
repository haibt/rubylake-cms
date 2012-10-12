class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_main_menus
  before_filter :default_theme, :only => :set_main_menus
  def set_main_menus
    @main_menus = Menu.main.all
    @theme = default_theme
    @setting = default_setting
  end
  
  protected

  def ckeditor_pictures_scope(options = {})
    ckeditor_filebrowser_scope(options)
  end

  def ckeditor_attachment_files_scope(options = {})
    ckeditor_filebrowser_scope(options)
  end
  
  def flash_notices
    flash[:notices] = [] unless flash[:notices]
    return flash[:notices]
  end
  def default_theme 
    return @default_theme  if @default_theme
    @default_theme = Theme.where(:is_active => true).last
    @default_theme = Theme.new(:color_background_article => '#e4e4e4', :color_background_body => '#e4e4e4', :color_background_menu => '#e4e4e4') unless @default_theme
    return @default_theme
  end

 def default_setting
    return @default_setting  if @default_setting
    @default_setting = Setting.last
    @default_setting = Setting.new(:about_us => 'About Us', :website => 'www.ithanoi.com', :email => 'scrum2B@ithanoi.com',:web_name =>'Scrum2B team', :title =>'Scrum2B: be scrum with us') unless @default_setting
    return @default_setting
  end
  
end
