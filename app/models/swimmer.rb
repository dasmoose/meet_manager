class Swimmer < ActiveRecord::Base
  has_many :swimmer_event_times, :dependent => :destroy
  has_many :events, :through => :swimmer_event_times
  has_many :heat_entries, :dependent => :destroy
  has_many :heats, :through => :heat_entries
  belongs_to :team
  attr_accessible :first_name, :last_name, :age, :team, :checked_in
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :team, presence: true
  
  def has_event?(event)
    !SwimmerEventTime.where(:swimmer_id => self.id, :event_id => event.id).empty?    
  end

  def display_name
    self.last_name + ", " + self.first_name
  end

  def unseeded_entries
    entries = []
    self.swimmer_event_times.each do |event|
      if event.heat_entry.nil?
        entries << event
      end
    end
    entries
  end
end
