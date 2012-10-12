class Setup::SetadminsController < ApplicationController
  def new
    @user = User.new
  end


  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if  @user.save
        flash[:notice] = "You have successfully to create acount"
         format.html { redirect_to '/setup/setting/new' }
      else
        format.html { redirect_to '/setup/setadmins/new' }
      end
    end
  end

end
