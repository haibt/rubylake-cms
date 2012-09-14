class ImagesController < ApplicationController
  def index
    @images = Image.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @images }
    end
  end

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
end
