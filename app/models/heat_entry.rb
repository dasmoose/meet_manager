class HeatEntry < ActiveRecord::Base
  has_one :swimmer
  belongs_to :heat
  attr_accessible :swimmer, :heat, :swim_time, :dq, :result_time
end
