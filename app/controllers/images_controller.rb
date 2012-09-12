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
end
