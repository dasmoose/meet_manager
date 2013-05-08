class Meet < ActiveRecord::Base

  has_many :events, :dependent => :destroy
  has_many :teams, :dependent => :destroy
  has_many :swimmers, :through => :teams

  attr_accessible :name, :location, :pool_size, :current_meet, :event

  validates :name, :location, :pool_size, :presence => true
  validates :pool_size, :numericality => { :only_integer => true }


  def self.get_active_meet 
    Meet.where("current_meet = ?", true).first
  end

  def self.set_active_meet(meet)
    Meet.all.each do |m|
     m.update_attribute( :current_meet, false )   
    end
    meet.update_attribute( :current_meet, true )
  end

  def current_event
    if self.event.nil? && self.events.count != 0  
      event = self.event.events.order("number ASC").first
      self.set_attributte( :event, event ) 
    else
      Event.find_by_id(self.event)
    end
  end

  def swimmer_event_times
    event_times = []
    self.events.each do |event|
      event_times << event.swimmer_event_times 
    end
    event_times.flatten!
  end

  def heat_entries
    entries = []
    self.events.each do |event|
      entries << event.heat_entries
    end
    entries.flatten!
  end

  def heats
    all_heats = []
    self.events.each do |event|
      all_heats << event.heats
    end
    all_heats.flatten!
  end

end
