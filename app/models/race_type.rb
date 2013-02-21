class RaceType < ActiveRecord::Base
  belongs_to :event
  attr_accessible :stroke, :distance, :individual
end
