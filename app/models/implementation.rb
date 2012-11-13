class Implementation < ActiveRecord::Base
  attr_accessible :description, :live_url, :name, :source_code, :source_url, :concept_id

  belongs_to :concept
  belongs_to :hero
  has_many :votes, as: :voteable, :dependent => :destroy

  def total_votes
    self.votes.map{ |v| v.value }.inject(:+)
  end
end
