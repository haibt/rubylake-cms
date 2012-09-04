class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_main_menus
  
  def set_main_menus
    @main_menus = Menu.main.all
  end

end
