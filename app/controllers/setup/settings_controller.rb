class Setup::SettingsController < ApplicationController
  
  def new
    @setting = Setting.new
  end

  def create
    @setting = Setting.new(params[:setting])
    respond_to do |format|
      if  @setting.save
        flash[:notice] = "You have successfully to setting"
        format.html { redirect_to '/setup/theme/new', notice: 'Setting was successfully created.' }
      else
        format.html { redirect_to '/setup/setting/new' }
      end
    end
  end
end
