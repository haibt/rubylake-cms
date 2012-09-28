class ImagesController < ApplicationController
  # def index
    # @images = Image.new
    # respond_to do |format|
      # format.html # new.html.erb
      # format.json { render json: @images }
    # end
  # end
  before_filter :check_img?,:only => :set_default
  def uploadFile
    @images = Image.new(params[:image])
    respond_to do |format|
      @images.save
      format.html { redirect_to "/article/#{@images.article.permalink}", notice: 'article was successfully updated.' }
    end
    @images = Image.all
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
  def current_user_could_upload?
     @image = Image.find(params[:id])
     redirect_to "/" unless @image && @image.upload_by?(current_user)
  end
  private
  def check_img?
    @image = Image.main.all
    @image.each do |img|
      img.update_attribute(:is_main, false)
    end
  end
  end
