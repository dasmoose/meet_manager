class HeatsController < ApplicationController
  def seed
    Heat.destroy_all

    @meet = Meet.find_by_id(params[:meet_id])

    @events = Event.find_all_by_meet_id(params[:meet_id])
    lane_nums = Meet.find_by_id(params[:meet_id]).pool_size
    
  # Loop through all the events
    @events.each do |event|
      @swimmers = SwimmerEventTime.find_all_by_event_id(event.id, :order => "entry_time DESC")
      swimmer_count = @swimmers.count
      heat_count = ( @swimmers.count.to_f / lane_nums.to_f ).ceil
      swimmer_split = swimmer_count / heat_count if heat_count != 0

      middle_lane = lane_nums / 2 + 1 

   # Loop through the number of heats 
      heat_count.times do |heat|
        cur_heat = Heat.create( event: event, number: heat + 1 ) 
        @swimmers.first.heat_entry = HeatEntry.create(swimmer: @swimmers.first.swimmer, heat: cur_heat, lane: middle_lane, swim_time: @swimmers.first.entry_time)
        
        @swimmers.shift 
        offset = -1
        left = true
    # Loop through swimmer count
        swimmer_split.times do |cur_swimmer|

          if @swimmers.count != 0
            @swimmers.first.heat_entry = HeatEntry.create(swimmer: @swimmers.first.swimmer, heat: cur_heat, lane: middle_lane + offset, swim_time: @swimmers.first.entry_time)
            @swimmers.shift
            
            if left
              offset = offset * -1
              left = false
            else
              offset = ( offset + 1 ) * -1 
              left = true
            end
          end     
        end
      end
    end

    redirect_to meet_all_heats_path(@meet) 
  end

  def all_heats
    @meet = Meet.find_by_id(params[:meet_id])
    @events = Event.find_all_by_meet_id(params[:meet_id])
  end

  def delete_heats
    meet = Meet.find_by_id(params[:meet_id])
    meet.heats.each do |heat|
      heat.destroy
    end
    redirect_to meet_all_heats_path(params[:meet_id])
  end
end
