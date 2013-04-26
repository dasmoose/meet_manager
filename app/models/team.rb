class Team < ActiveRecord::Base
  belongs_to :meet
  has_many :swimmers, :dependent => :destroy
  attr_accessible :name, :short_name, :location, :coach_name, :meet

  validates :name, :location, :coach_name, :meet, :presence => true
end
