class TeamsController < ApplicationController

  before_filter :check_if_logged_in

  def show
  end

  def edit
  end

  def download_csv
    file = Tempfile.new('foo')
    meet = Meet.find_by_id(params[:meet_id]) 
    
    file.print "last_name, first_name, gender, age"
    meet.events.count.times do |event|
      file.print ", #{event + 1}"
    end
    file.puts

    file.close
    send_file file.path, :filename => "import.csv" 
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

  def new
    @teams = Team.find_all_by_meet_id(params[:meet_id], :order => "name ASC")
    @meet = Meet.find_by_id(params[:meet_id])
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
    @meet = Meet.find_by_id(params[:meet_id])
    @team = Team.find_by_id(params[:id])
    @team.destroy
    @teams = Team.find_all_by_meet_id(params[:meet_id], :order => "name ASC")

    respond_to do |format|
      format.html { redirect_to new_meet_team_path(params[:meet_id]) }
      format.js
    end
  end
  
  def import_files
    @meet = Meet.find_by_id(params[:meet_id])
    @team = Team.find_by_id(params[:team_id])

    uploaded_io = params[:team][:import_data]    

    swimmer_lines = uploaded_io.read.split("\n")
    swimmer_lines.shift 

    swimmer_lines.each do |line|
      @events = line.split(", ")
      last_name = @events.shift
      first_name = @events.shift
      
      search = Swimmer.where("last_name = ? AND first_name = ? AND team_id = ?", last_name, first_name, @team.id)

      if !search.first.nil?
        @swimmer = search.first
      else
        @swimmer = Swimmer.new
      end

      @swimmer.last_name = last_name
      @swimmer.first_name = first_name
      @events.shift # age
      @swimmer.age = @events.shift
      @swimmer.team = @team
      @swimmer.save

      @events.each_index do |event|
      if @events[event] != ""
        @event_entry = SwimmerEventTime.new
        @event_entry.swimmer = @swimmer
        @curr_event = Event.find_all_by_meet_id(params[:meet_id], :conditions => ["number = #{event + 1}"]).first
        puts "EVENT ENTRY = #{@events[event]} ANDD #{event}"
         if !@curr_event.nil?
           @event_entry.event = @curr_event
           min = @events[event][/^\d+:/].chop.to_i * 60000
           sec = @events[event][/\d+\./].chop.to_i * 1000
           mil = @events[event][/\.\d+/].delete(".").to_i
           puts "#{min} #{sec} #{mil}"
           @event_entry.entry_time = min + sec + mil
           puts "#{@event_entry.entry_time}"
           @event_entry.save
         end
      end
      end
    end
    redirect_to meet_team_swimmers_path(@meet, @team)
  end
  
  def check_if_logged_in
    if !signed_in?
      redirect_to root_path
    end
  end

end

  
