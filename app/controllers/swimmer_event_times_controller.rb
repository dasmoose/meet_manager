class SwimmerEventTimesController < ApplicationController
  def edit
  end

  def update
    @team = Team.find_by_id(params[:id])
    @meet = Meet.find_by_id(params[:meet_id])
    @team.update_attributes(name: params[:team][:name],
                            location: params[:team][:location],
                            coach_name: params[:team][:coach_name])
    @teams = Team.find_all_by_meet_id(params[:meet_id], :order => "name ASC")

    respond_to do |format|
      format.html { redirect_to new_meet_team_path(@meet) }
      format.js
    end
  end

  def create 
    @event_time = SwimmerEventTime.new
    @meet = Meet.find_by_id(params[:meet_id])
    @swimmer = Swimmer.find_by_id(params[:swimmer_id])
    @team = Team.find_by_id(params[:team_id])
    event = Event.find_by_id(params[:event])

    @event_time.event = Event.find_by_id(params[:event])
    @event_time.swimmer = @swimmer
    @event_time.entry_time = (params[:min].to_i * 60000) + (params[:sec].to_i * 1000) + params[:mil].to_i
    @event_time.save
    
    respond_to do |format|
      format.html { redirect_to new_meet_team_path(@meet) }
      format.js
    end
  end

  def destroy
    @team = Team.find_by_id(params[:id])
    @team.destroy
    @teams = Team.find_all_by_meet_id(params[:meet_id], :order => "name ASC")

    respond_to do |format|
      format.html { redirect_to new_meet_team_path(params[:meet_id]) }
      format.js
    end
  end
end

