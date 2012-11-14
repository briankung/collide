class Concept < ActiveRecord::Base
	acts_as_commentable
  attr_accessible :description, :name, :url

  has_many :implementations
  has_many :comments, as: :commentable, :dependent => :destroy
  belongs_to :hero

  def total_votes
    self.votes.map{ |v| v.value }.inject(:+)
  end
end
