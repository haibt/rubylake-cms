class SettingsController < ApplicationController
  
  def index
    @setting = Setting.new
  end

  def create
    #catch cac tham so, save vao doi tuong settings
    #sau khi save xong, rediect sang trang /setup/layout/index
    @setting = Setting.new(params[:setting])
    respond_to do |format|
      if  @setting.save
        flash[:notice] = "You have successfully to setting"
        format.html { redirect_to '/theme/index', notice: 'Setting was successfully created.' }
      end
    end
  end
end
