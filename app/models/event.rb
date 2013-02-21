class Event < ActiveRecord::Base
  has_one :meet 
  has_one :race_type
  attr_accessible :number, :gender, :age, :race_type, :meet
end
