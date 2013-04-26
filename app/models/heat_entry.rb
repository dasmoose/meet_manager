class HeatEntry < ActiveRecord::Base
  belongs_to :swimmer
  belongs_to :heat
  belongs_to :swimmer_event_time
  attr_accessible :swimmer, :heat, :swim_time, :dq, :result_time, :lane, :swimmer_event_time

end
