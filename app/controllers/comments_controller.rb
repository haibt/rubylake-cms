class CommentsController < ApplicationController
  before_filter :check_commentable_object!
  COMMENTABLE_TYPES = ["article"]

  def create
    @comment = Comment.create_for(current_user, @commentable, params[:comment])
    if @comment && @comment.valid? && @comment.save
      render :json => {:result => "success", :comment => @comment.to_maps}
    else
      render :json => {:result => "fail", :message => (@comment ? @comment.errors.full_messages : "Error to create the comment") }
    end
    @comment = Comment.all
  end

  private

  def check_commentable_object!
    Rails.logger.info "parameter 1: #{params[:comment].to_s}"
    if(params[:comment] && params[:comment][:commentable_type])
        @commentable = Article.find_by_id params[:comment][:commentable_id]
    end
    Rails.logger.info "Object: #{@commentable ? @commentable.to_s : "NULL"}"
    return true if @commentable
    render :json => {:result => "false", :message => "Not found object to comment" }
  end
  def destroy
  @comment = Comment.find_by params [:id]
  @comment.destroy_comment
  end

end
