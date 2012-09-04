class CategoryModerator < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :category
  belongs_to :user, :class_name => 'User', :foreign_key => 'moderator_id'

  attr_accessible :category_id, :moderator_id
end