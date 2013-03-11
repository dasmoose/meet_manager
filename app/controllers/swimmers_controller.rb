class SwimmersController < ApplicationController
  def index
    @alphabet = ("a".."z").to_a
    @alpha_arr = []
    for i in "a".."z"
      @alpha_arr << Swimmer.find_all_by_team_id(:conditions => ["last_name LIKE ?", "#{i}%"]) 
    end

  end
  
  def find_events
    @events = Event.find_all_by_meet_id(params[:meet_id])
    @swimmer = Swimmer.new
    
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

  end 
end
