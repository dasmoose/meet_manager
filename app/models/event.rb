class Event < ActiveRecord::Base
  belongs_to :meet 
  belongs_to :race_type
  attr_accessible :number, :gender, :age, :race_type, :meet
  
  validates :number, :gender, :age, :race_type, :meet, :presence => true
  validates :number, :uniqueness => { :scope => :meet_id, :message => "Event Already Exists" }

end
