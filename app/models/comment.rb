class Comment < ActiveRecord::Base
  acts_as_nested_set :scope => [:commentable_id, :commentable_type]

  validates_presence_of :body
  validates_presence_of :hero

  # NOTE: install the acts_as_votable plugin if you
  # want hero to vote on the quality of comments.
  #acts_as_voteable

  belongs_to :commentable, :polymorphic => true

  # NOTE: Comments belong to a hero
  belongs_to :hero

  # Helper class method that allows you to build a comment
  # by passing a commentable object, a hero_id, and comment text
  # example in readme
  def self.build_from(obj, hero_id, comment)
    c = self.new
    c.commentable_id = obj.id
    c.commentable_type = obj.class.base_class.name
    c.body = comment
    c.hero_id = hero_id
    c
  end

  #helper method to check if a comment has children
  def has_children?
    self.children.size > 0
  end

  # Helper class method to lookup all comments assigned
  # to all commentable types for a given hero.
  scope :find_comments_by_hero, lambda { |hero|
    where(:hero_id => hero.id).order('created_at DESC')
  }

  # Helper class method to look up all comments for
  # commentable class name and commentable id.
  scope :find_comments_for_commentable, lambda { |commentable_str, commentable_id|
    where(:commentable_type => commentable_str.to_s, :commentable_id => commentable_id).order('created_at DESC')
  }

  # Helper class method to look up a commentable object
  # given the commentable class name and id
  def self.find_commentable(commentable_str, commentable_id)
    commentable_str.constantize.find(commentable_id)
  end
end
