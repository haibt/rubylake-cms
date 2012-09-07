class Comment < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :comment,:commentable_id, :commentable_type
  belongs_to :commentable, :polymorphic => true
  
  belongs_to :user
  default_scope :order => 'created_at ASC'

  def self.create_for (user, commentable, params)
    comment = Comment.new(params)
    comment.commentable_id = commentable.id
    comment.commentable_type = commentable.class.name
    comment.user = user
    return comment
  end

  def to_maps
    { :id => self.id,:commentable_id => self.commentable_id, :commentable_type => self.commentable_type ,:comment => self.comment}
  end

  def deletable_by? (check_user)
    return false unless check_user
    return check_user.admin? || check_user == self.user || check_user.moderator?
    #return category && category.updatable_by?(check_user)
  end

  def editable_by? (check_user)
    return false unless check_user
    return check_user == self.user
  end

end
