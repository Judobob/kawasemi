class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  def index
    @events = Event.all
    respond_with(@events)
  end

  def show
    respond_with(@event)
  end

  def new
    
    @event = Event.new
    respond_to do |format|
      format.html { redirect_to root_path } #for my controller, i wanted it to be JS only
      format.js
    end
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    if @event.save
    #passed  
    else
    #errors
    @event.errors.full_messages
   
    end
    respond_to do |format|
        format.html { redirect_to root_path } #for my controller, i wanted it to be JS only
        format.js
      end  
  end

  def update
    @event.update(event_params)
    respond_with(@event)
  end

  def destroy
    @event.destroy
    respond_with(@event)
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :description)
    end
end
