class Setup::ThemesController < ApplicationController
 
  def new
    @theme = Theme.new
  end
 def message
   
 end
  def create
   
    @theme = Theme.new(params[:theme])
    respond_to do |format|
      if  @theme.save
        flash[:notice] = "You have successfully to theme"
        format.html { redirect_to "/setup/theme/message", notice: 'theme was successfully created.' }
      else
         format.html { redirect_to "/setup/theme/new"}
      end
    end
  end
end
