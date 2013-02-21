class CreateSwimmerEventTimes < ActiveRecord::Migration
  def change 
   create_table :swimmer_event_times do |t|
    t.references :swimmer
    t.references :event
    t.integer :entry_time
   end
  end
end
