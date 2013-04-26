class SwimmersController < ApplicationController
  def index
    @swimmer = Swimmer.new
    @team = Team.find_by_id(params[:team_id])
    @meet = Meet.find_by_id(params[:meet_id])
    @alphabet = ("a".."z").to_a
    @gender_list = ["Male", "Female"]
    @alpha_arr = []
    for i in "a".."z"
      @alpha_arr << Swimmer.find_all_by_team_id(params[:team_id], :conditions => ["last_name LIKE ?", "#{i}%"]) 
    end
  end
  
  def find_events
    @gender_list = ["Male", "Female"]
    @events = Event.where(:gender => @gender_list[params[:gender].to_i],
                          :meet_id => params[:meet_id])
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new 
    @swimmer = Swimmer.new
    @team = Team.find_by_id(params[:team_id])
    @gender_list = [["Male", 0], ["Female", 1]]
  end

  def create
    @gender_list = ["Male", "Female"]
    @alphabet = ("a".."z").to_a
    @swimmer = Swimmer.new
    @swimmer.first_name = params[:swimmer][:first_name]
    @swimmer.last_name = params[:swimmer][:last_name]
    @swimmer.age = params[:swimmer][:age]

    @team = Team.find_by_id(params[:team_id])
    @swimmer.team = @team
    
    @meet = Meet.find_by_id(params[:meet_id])
    @swimmer.save
    
    @alpha_arr = []
    for i in "a".."z"
      @alpha_arr << Swimmer.find_all_by_team_id(params[:team_id], :conditions => ["last_name LIKE ?", "#{i}%"])
    end
    respond_to do |format|
      format.html { redirect_to new_meet_team_swimmer(@meet, @team) }
      format.js
    end
  end 

  def show 
    @swimmer_event_time = SwimmerEventTime.new
    @meet = Meet.find_by_id(params[:meet_id])
    @team = Team.find_by_id(params[:team_id])
    @swimmer = Swimmer.find_by_id(params[:id])
   
    @all_events = []
    Event.find_all_by_meet_id(@meet).each do |event|
      @all_events << event.to_h 
    end

    @heat_entries = @swimmer.heat_entries
    @unseeded_events = @swimmer.unseeded_entries
  end
  

  def add_event
    @event_time = SwimmerEventTime.new
    @meet = Meet.find_by_id(params[:meet_id])
    @swimmer = Swimmer.find_by_id(params[:swimmer_id])
    @team = Team.find_by_id(params[:team_id])
    event = Event.find_by_id(params[:event])

    @event_time.event = Event.find_by_id(params[:event])
    @event_time.swimmer = @swimmer
    @event_time.entry_time = (params[:min].to_i * 60000) + (params[:sec].to_i * 1000) + params[:mil].to_i
    @event_time.save
    @unseeded_events = @swimmer.unseeded_entries

    respond_to do |format|
      format.html { redirect_to new_meet_team_path(@meet) }
      format.js
    end
  end
end
