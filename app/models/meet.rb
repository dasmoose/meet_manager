class Meet < ActiveRecord::Base
  has_many :events, :dependent => :destroy
  has_many :teams, :dependent => :destroy
  attr_accessible :name, :location, :pool_size

  validates :name, :location, :pool_size, :presence => true
  validates :pool_size, :numericality => { :only_integer => true }

  def swimmers 
    swimmer = []
    self.teams.each do |team|
      swimmer << team.swimmers
    end
    swimmer.flatten!
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
