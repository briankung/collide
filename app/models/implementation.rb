class Implementation < ActiveRecord::Base
	acts_as_commentable
  attr_accessible :description, :live_url, :name, :source_code, :source_url, :concept_id

  belongs_to :concept
  belongs_to :hero
  has_many :votes, as: :voteable, :dependent => :destroy
  has_many :comments, as: :commentable, :dependent => :destroy

  def total_votes
    self.votes.map{ |v| v.value }.inject(:+)
  end
end
