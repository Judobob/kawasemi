class EventTimesController < ApplicationController
  before_action :set_event_time, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  def index
    @event_times = EventTime.all
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
