class MeetsController < ApplicationController
  
  def show
    @meet = Meet.find_by_id(params[:id])
    @teams = Team.find_all_by_meet_id(params[:id], :order => "name ASC")
    @events = Event.find_all_by_meet_id(params[:id], :order => "number ASC")
  end
  
  def edit

  end

  def update

  end
  
  def new
    @event_types = RaceType.all
    @meet = Meet.new
  end

  def create
    @meet = Meet.new(params[:meet])
    if @meet.save
      redirect_to new_meet_event_path(@meet)
    else
      render 'new'
    end
    
  end

  def destroy

  end
  
end
