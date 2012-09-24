class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_main_menus
  
  def set_main_menus
    @main_menus = Menu.main.all
    @theme = Theme.active.all
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

end
