class ImagesController < ApplicationController
  
   before_filter :check_img?,:only => :set_default
  # before_filter :check_update_img?,:only => :destroy
  
  def uploadFile
    @images = Image.new(params[:image])
    respond_to do |format|
      @images.save
      format.html { redirect_to "/article/#{@images.article.permalink}", notice: 'article was successfully updated.' }
    end
  end
  def destroy
    @image = Image.find_by_id params[:id]
    if @image 
      if @image.destroy
      
      render :json => {:result => "true", :message => "Image was delete successfull" }
      else
        render :json => {:result => "false", :message => "Fail to delete the message" }
      end
    else
      render :json => {:result => "false", :message => "Not found object to image" } 
    end
  end
  
  def set_default
    @image = Image.find_by_id params[:id]
    @image.update_attribute(:is_main,true)
    render :json => {:result => "true", :message => "Image was setted default successfull" }
  end 
  
  def set_public
    @image = Image.find_by_id params[:id]
    @image.update_attribute(:is_public,true)
    render :json => {:result => "true", :message => "Image was setted public successfull" }
  end 
  
  def check_img?
    @image = Image.main.all
    @image.each do |img|
      img.update_attribute(:is_main, false)
    end
  end
#   
# def check_update_img?
    # @image = Image.find_by_id params[:id]
    # redirect_to "/" unless @image && @image.updatableimg_by?(current_user)
  # end
 
  end
