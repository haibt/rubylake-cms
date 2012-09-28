class ThemesController < ApplicationController
 
  def index
    @theme = Theme.new
  end
 def message
   
 end
  def create
   
    @theme = Theme.new(params[:theme])
    respond_to do |format|
      if  @theme.save
        flash[:notice] = "You have successfully to theme"
        format.html { redirect_to "/theme/message", notice: 'theme was successfully created.' }
      end
    end
  end
end
