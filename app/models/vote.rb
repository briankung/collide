class Vote < ActiveRecord::Base
  attr_accessible :value
  belongs_to :voteable, polymorphic: true
end
