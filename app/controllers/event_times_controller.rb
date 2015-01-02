class EventTimesController < ApplicationController
  before_action :set_event_time, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  def index
    #get this weeks date or the date required
    if params.has_key?(:start_date)
      begin
        start_date = Date.parse(params[:start_date])
        
      rescue ArgumentError
        start_date=Date.current()
        
      end 
    else  
      start_date=Date.current()
    end
    start_date = start_date.beginning_of_week()
    #get last date
    end_date=start_date.to_time.advance(:weeks => 1).to_date
    @end_date=end_date
    #get previous date
    previous_date=start_date.to_time.advance(:weeks => -1).to_date
    @previous_date=previous_date
    #get first date from db and check if next tabs available
    first_record=EventTime.order('start_time DESC').last
    first_date=first_record.start_time.to_date
    if previous_date>=first_date
      @previous_link=0
    else
      @previous_link=1
    end
    #get last date from db and check if next tab is available
    last_record=EventTime.order('start_time DESC').first
    final_date=last_record.start_time.to_date
    if end_date<=final_date
      
      @next_link=0
    else
      @next_link=1
    end
    @start_date=start_date
    @event_times = EventTime.where(:start_time => start_date...end_date).order('start_time')
    @event_days = @event_times.group_by{|day| day.start_time.beginning_of_day}
    puts @event_days
    respond_with(@event_times)
  end

  def show
    respond_with(@event_time)
  end

  def new
    @event_time = EventTime.new
    respond_with(@event_time)
  end

  def edit
  end

  def create
    
    #get the parameters
    new_event_params=event_time_params
    
    #manipulate the dates for db storage
    new_event_params[:start_time] = DateTime.strptime(new_event_params[:start_time],'%m/%d/%Y %I:%M %p')
    new_event_params[:end_time] = DateTime.strptime(new_event_params[:end_time],'%m/%d/%Y %I:%M %p')
    
    #create new event
    @event_time = EventTime.new(new_event_params)
    
    #create new exercises if they exist
    if new_event_params[:exercise_events_attributes]..present?
      new_event_params[:exercise_events_attributes].each do |exercise|
        @event_time.exercise_events.build(:exercise_id => exercise[1][:exercise_id])
      end
    end
    
    #save the event
    @event_time.save
    
    respond_with(@event_time)
  end

  def update
    @event_time.update(event_time_params)
    respond_with(@event_time)
  end

  def destroy
    @event_time.destroy
    respond_with(@event_time)
  end

  private
    def set_event_time
      @event_time = EventTime.find(params[:id])
    end

    def event_time_params
      params.require(:event_time).permit(:start_time, :end_time, :max_participants,:event_id, exercise_events_attributes: [ :exercise_id,:_destroy])
    end
end
