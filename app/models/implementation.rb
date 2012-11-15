class Implementation < ActiveRecord::Base
	acts_as_commentable
	acts_as_votable
  attr_accessible :description, :live_url, :name, :source_code, :source_url, :concept_id

  belongs_to :concept
  belongs_to :hero
  has_many :comments, as: :commentable, :dependent => :destroy
end
