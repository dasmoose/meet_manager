class SwimmerEventTime < ActiveRecord::Base
 has_one :swimmer
 has_one :race_time
 attr_accessible :swimmer, :event, :entry_time
end
