class Meet < ActiveRecord::Base
  has_many :event
  attr_accessible :name, :location, :pool_size
end
