class Concept < ActiveRecord::Base
  attr_accessible :description, :name, :url

  has_many :implementations
  belongs_to :hero
end
