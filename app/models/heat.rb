class Heat < ActiveRecord::Base
  belongs_to :event
  has_many :heat_entries
  attr_accessible :event, :number, :heat
end
