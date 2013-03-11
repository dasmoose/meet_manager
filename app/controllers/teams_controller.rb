class TeamsController < ApplicationController
  def show
  end

  def edit
  end

  def update
    @team = Team.find_by_id(params[:id])
    @meet = Meet.find_by_id(params[:meet_id])
    @team.update_attributes(name: params[:team][:name],
                            location: params[:team][:location],
                            coach_name: params[:team][:coach_name])
    @teams = Team.find_all_by_meet_id(params[:meet_id], :order => "name ASC")

    redirect_to new_meet_team_path(@meet)
  end

  def new
    @teams = Team.find_all_by_meet_id(params[:meet_id], :order => "name ASC")
    @team = Team.new
  end

  def create 
    @team = Team.new
    @team.name = params[:team][:name]
    @team.location = params[:team][:location]
    @team.coach_name = params[:team][:coach_name]
    @meet = Meet.find_by_id(params[:meet_id])
    @team.meet = @meet

    @team.save
    @teams = Team.find_all_by_meet_id(params[:meet_id], :order => "name ASC")
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
