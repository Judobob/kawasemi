class UserEventTimesController < ApplicationController
  before_action :set_user_event_time, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  
  def create
    
  end
  
  private
    def set_user_event_time
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :description)
    end
end