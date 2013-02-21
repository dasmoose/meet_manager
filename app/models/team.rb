class Team < ActiveRecord::Base
  attr_accessible :name, :short_name, :location, :coach_name
  has_many :swimmers
end
