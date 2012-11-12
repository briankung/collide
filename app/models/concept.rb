class Concept < ActiveRecord::Base
  attr_accessible :description, :name, :url

  has_many :implementations
  has_many :votes, as: :voteable, :dependent => :destroy
  belongs_to :hero

  def total_votes
    self.votes.map{ |v| v.value }.inject(:+)
  end
end
