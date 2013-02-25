class EventsController < ApplicationController
  
  def new
    @event = Event.new
    @meet = Meet.find_by_id(params[:meet_id])
    @gender_list = [["Male", 0], ["Female", 1]]
    @events = Event.find_all_by_meet_id(params[:meet_id], :order => "number ASC")
  end

  def create
    @events = Event.find_all_by_meet_id(params[:meet_id], :order => "number ASC")
    @gender_list = ["Male", "Female"]
    @event = Event.new
    @event.number = params[:event][:number]
    @event.gender = @gender_list[params[:gender].to_i]

    @meet = Meet.find_by_id(params[:meet_id])
    @event.meet = @meet
    @event.age = params[:event][:age]

    @race_type = RaceType.find_by_id(params[:event][:race_type])
    @event.race_type = @race_type
    
    if @event.save 
      respond_to do |format|
        format.html { redirect_to new_meet_event_path(@meet) }
        format.js
      end
    else
      flash.now[:error]=@event.errors.full_messages
      format.html { render :nothing => true }
      format.js
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
