class Event < ActiveRecord::Base
  belongs_to :meet
  belongs_to :race_type
  has_many :swimmer_event_times, :dependent => :destroy
  has_many :swimmers, :through => :swimmer_event_times

  has_many :heats
  attr_accessible :number, :gender, :age, :race_type, :meet
  
  validates :number, :gender, :age, :race_type, :meet, :presence => true
  validates :number, :uniqueness => { :scope => :meet_id, :message => "Event Already Exists" }

  def heat_entries
    entries = []
    self.heats.each do |heat|
      entries << heat.heat_entries
    end
    entries.flatten!
  end

  def non_seeded
    entries = []
    self.swimmer_event_times.each do |event|
      if event.heat_entry.nil?
        entries << event
      end
    end
    entries
  end

  def display_text
    "# #{self.number} - #{self.age} #{self.gender} #{self.race_type.display_name}"
  end

  def to_h
   [ self.display_text, self.id ]
  end
end
