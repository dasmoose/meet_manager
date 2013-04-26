class Heat < ActiveRecord::Base
  belongs_to :event
  has_many :heat_entries, :dependent => :destroy
  has_many :swimmers, :through => :heat_entries

  attr_accessible :event, :number

end
