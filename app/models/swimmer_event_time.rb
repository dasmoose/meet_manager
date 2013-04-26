class SwimmerEventTime < ActiveRecord::Base
  belongs_to :swimmer
  belongs_to :event
  has_one :heat_entry
  attr_accessible :swimmer, :event, :entry_time, :heat_entry

  def format_time
    mil = self.entry_time
    sec = mil / 1000
    mil = mil % 1000
    min = sec / 60
    sec = sec % 60

    "#{min}:#{sec}.#{mil}"
  end
end
