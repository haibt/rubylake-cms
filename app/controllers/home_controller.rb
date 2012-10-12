class HomeController < ApplicationController

  
  
  def profile

    @user = User.all
    @articles = Article.live.public.order("updated_at DESC").limit(8)
    @featured_articles = Article.live.public.featured.order("updated_at DESC").limit(2)
    @blog_category = Category.blog
    ids = Category.blog(:select => :id).collect(&:id)
    @blog_articles = Article.live.public.where(:category_id => ids).limit(5)

  end

end
