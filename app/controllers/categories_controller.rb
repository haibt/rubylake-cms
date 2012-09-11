class CategoriesController < ApplicationController

  def show
    @category = Category.find_by_permalink params[:permalink]
    @articles = @category.articles.public.live.order("updated_at DESC")
  end

  def index
    @categories = Category.all
    @articles = Article.live.public.order("updated_at DESC")
  end

  def new
    @category = Category.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category }
    end
  end

  def create
    @category = Category.new(params[:category]) 
    respond_to do |format|
      if @category.save
        format.html { redirect_to "/category/#{@category.permalink}", notice: 'Category was successfully created.' }
        format.json { render json: @category, status: :created, location: @category }
      else
        format.html { render action: "new" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end

  end

  def edit
    @category = Category.find_by_permalink params[:permalink]
  end

  def update
      @category = Category.find_by_permalink params[:permalink]
    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to "/category/#{@category.permalink}", notice: 'category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render "edit" }
      end
    end
  end

  def destroy
    @category = Category.find_by_id params[:id]
    @category.destroy

    respond_to do |format|
      format.html { redirect_to :action =>'index'}
      format.json { head :no_content }
    end
  end

end
