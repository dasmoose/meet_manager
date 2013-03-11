class Meet < ActiveRecord::Base
  has_many :events
  has_many :teams
  attr_accessible :name, :location, :pool_size

  validates :name, :location, :pool_size, :presence => true
  validates :pool_size, :numericality => { :only_integer => true }
end
