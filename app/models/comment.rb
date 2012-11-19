class Comment < ActiveRecord::Base
  attr_accessible :ancestry, :content, :hero_id
  belongs_to :commentable, polymorphic: true
end
