class ArticlesController < ApplicationController

  before_filter :current_user_could_update?, :only => [:edit, :move, :update, :delete, :create]
  before_filter :default_theme, :only => [:edit, :move, :create,:show]
  def index
  end

  def show
    @article = Article.find_by_permalink params[:permalink]
    @theme = default_theme
  end

  def edit
    @theme = default_theme
  end

  def move
    @theme = default_theme
    if request.get?
      @categories = Category.all

    elsif request.post?
      @article.update_attribute(:category_id, params[:new_category_id])
      redirect_to "/article/#{@article.permalink}"
      flash[:notice] = "You have successfully to move the article: #{@article.title}"
    end
  end

  def delete
    @article.deleted_by = current_user.id
    @article.updated_at = Time.now
    if @article.save
      flash[:notice] = "You have successfully to delete the article: #{@article.title}"
    elsif
    flash[:error] = "You have error to delete the article: #{@article.title}"

    end
    redirect_to '/category'
  end

  def update
    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to "/article/#{@article.permalink}" }
        format.json { head :no_content }
        flash[:notice] = "You have successfully to update the article: #{@article.title}"

      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
        flash[:error] = "You have error to update the article: #{@article.title}"

      end
    end
  end

  def destroy
    @article = Article.find( params[ :id ] )
    @article.destroy
    respond_to do | format |
      logger.info { "DESTROY: #{format}" }
      format.html { render :layout => false, :inline => "#{@article.id}" }
      format.json  { head :ok, data => @article.id }
    end
  end

  def new
    @theme = default_theme
    @article = Article.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  def create
    @theme = default_theme
    @article = Article.new(params[:article])
    respond_to do |format|
      @article.user_id = current_user.id
      if @article.save
        flash[:notice] = "You have successfully to create the article"
        format.html { redirect_to "/article/#{@article.permalink}", notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @artilce }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
        flash[:error] = "You have error to create the article"
      end
    end
  end

  private

  def current_user_could_update?
    @article = Article.find_by_permalink params[:permalink]
    redirect_to "/" unless @article && @article.updatable_by?(current_user)
  end

end
