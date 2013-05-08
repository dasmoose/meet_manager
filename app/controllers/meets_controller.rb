class MeetsController < ApplicationController
  
  def index
    @meets = Meet.all
  end

  def show
    @meet = Meet.find_by_id(params[:id])
    @teams = Team.find_all_by_meet_id(params[:id], :order => "name ASC")
    @events = Event.find_all_by_meet_id(params[:id], :order => "number ASC")
    @swimmers = @meet.swimmers.order("last_name ASC")
  end
  
  def edit
    @meet = Meet.find_by_id(params[:id])
  end

  def update
    @meet = Meet.find_by_id(params[:id])
    @meet.update_attributes(params[:meet])
    redirect_to meet_path(@meet)
  end
  
  def new
    @event_types = RaceType.all
    @meet = Meet.new
  end

  def create
    @meet = Meet.new(params[:meet])
    if @meet.save
      redirect_to meet_path(@meet)
    else
      render 'new'
    end
    
  end

  def destroy
    meet = Meet.find_by_id(params[:id])
    meet.destroy
    redirect_to meets_path
  end
  
  def toggle_active
    meet = Meet.find_by_id(params[:meet_id])
    @active = !meet.current_meet
    if meet.current_meet 
      meet.update_attribute( :current_meet, false ) 
    else
      Meet.set_active_meet(meet)      
    end

    redirect_to meet_path(meet)
  end

  def event_board
    @meet = Meet.get_active_meet
  end

end
