class Implementation < ActiveRecord::Base
  attr_accessible :description, :live_url, :name, :source_code, :source_url

  belongs_to :concept
end
