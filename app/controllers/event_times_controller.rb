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
    @event_time = EventTime.new(event_time_params)
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
      params.require(:event_time).permit(:start_time, :end_time, :max_participants,:event_id)
    end
end
