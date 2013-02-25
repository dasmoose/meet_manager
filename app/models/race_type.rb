class RaceType < ActiveRecord::Base
  belongs_to :event
  attr_accessible :stroke, :distance, :individual

  def display_name
    "#{self.distance}yd #{self.stroke}"
  end
end
