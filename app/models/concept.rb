class Concept < ActiveRecord::Base
	acts_as_votable
  attr_accessible :description, :name, :url

  has_many :implementations
  has_many :comments, as: :commentable, :dependent => :destroy
  belongs_to :hero
end
