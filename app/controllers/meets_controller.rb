class MeetsController < ApplicationController
  
  def show
    
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
      redirect_to team_new_path(:meet => @meet.id)
    else
      render 'new'
    end
    
  end

  def destroy

  end
  
end
