class EventsController < ApplicationController
  
  def new
    @event = Event.new
    @meet = Meet.find_by_id(params[:meet_id])
    @gender_list = [["Male", 0], ["Female", 1]]
    @events = Event.find_all_by_meet_id(params[:meet_id], :order => "number DESC")
    @max_event = Event.find_all_by_meet_id(@meet, :order => "number DESC").first
    if @max_event.nil?
      @current_number = 1
    else 
      @current_number = @max_event.number + 1
    end
  end

  def show 
  end

  def create
    @gender_list = ["Male", "Female"]
    @event = Event.new
    @event.number = params[:event][:number]
    @event.gender = @gender_list[params[:gender].to_i]

    @meet = Meet.find_by_id(params[:meet_id])
    @event.meet = @meet
    @event.age = params[:event][:age]

    @race_type = RaceType.find_by_id(params[:event][:race_type])
    @event.race_type = @race_type
    
    @event.save 
    @events = Event.find_all_by_meet_id(params[:meet_id], :order => "number DESC")
      respond_to do |format|
        format.html { redirect_to new_meet_event_path(@meet) }
        format.js
      end
  end

  def update
    @gender_list = ["Male", "Female"]
    @meet = Meet.find_by_id(params[:meet_id])
    @event = Event.find_by_id(params[:id])
    @race_type = RaceType.find_by_id(params[:event][:race_type])

    @event.update_attributes(number: params[:event][:number],
                             gender: @gender_list[params[:gender].to_i],
                             age: params[:event][:age],
                             race_type: @race_type)
    @events = Event.find_all_by_meet_id(params[:meet_id], :order => "number DESC") 
  redirect_to new_meet_event_path(@meet)
  end

  def destroy
    @event = Event.find_by_id(params[:id])
    @event.destroy
    @events = Event.find_all_by_meet_id(params[:meet_id], :order => "number ASC")

    respond_to do |format|
      format.html { redirect_to new_meet_event_path(params[:meet_id]) }
      format.js
    end
  end

end
