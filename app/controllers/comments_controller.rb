class CommentsController < ApplicationController
  before_filter :check_commentable_object!, :except => [:destroy, :update]
  before_filter :check_update_comment!, :only => :update
  COMMENTABLE_TYPES = ["article"]

  def create
    @comment = Comment.create_for(current_user, @commentable, params[:comment])
    if @comment && @comment.valid? && @comment.save
      data = render_to_string(:partial => "/articles/comment_show", :locals => {:comment => @comment, :current_user => current_user})
      render :json => {:result => "success", :comment => @comment.to_maps, :content => data}
    else
      render :json => {:result => "fail", :message => (@comment ? @comment.errors.full_messages : "Error to create the comment") }
    end
    @comment = Comment.all
  end

  def destroy
    @comment = Comment.find_by_id params[:id]
    Rails.logger.info "Param id: #{params[:id]}"
    if @comment 
      if @comment.destroy
       render :json => {:result => "true", :message => "Success to delete the message" }
      else
        render :json => {:result => "false", :message => "Fail to delete the message" }
      end
    else
      render :json => {:result => "false", :message => "Not found object to comment" } 
    end
  end

  def update
    if @comment.update_attribute(:comment, params[:comment])
      data = render_to_string(:partial => "/articles/comment_show", :locals => {:comment => @comment, :current_user => current_user})
      Rails.logger.info "Data: #{data}"
      render :json => {:result => "success", :message => "Success to update the message",
                       :content => data }
    else
      render :json => {:result => "fail", :message => "Fail to update the message" }
    end
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
  
  def check_update_comment!
    @comment = Comment.find(params[:id])
    return true if @comment 
    render :json => {:result => "false", :message => "Not found object to comment" }
  end
end
