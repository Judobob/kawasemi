class EventImagesController < ApplicationController
  before_action :set_event_image, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  def index
    @event_images = EventImage.all
    respond_with(@event_images)
  end

  def show
    respond_with(@event_image)
  end

  def new
    
    @event_image = EventImage.new
    
    respond_to do |format|
      format.html { redirect_to root_path } #for my controller, i wanted it to be JS only
      format.js
    end
  end

  def edit
  end

  def create
    puts 'hello'
    @event_image = EventImage.new(event_image_params)
    if @event_image.save
    #passed  
    else
    #errors
    @event_image.errors.full_messages
   
    end
    
  end

  def update
    @event_image.update(event_image_params)
    respond_with(@event_image)
  end

  def destroy
    @event_image.destroy
    respond_with(@event_image)
  end

  private
    def set_event_image
      @event_image = EventImage.find(params[:id])
    end

    def event_image_params
      params.require(:event_image).permit(:alt_text, :description, :event_image, :event_image_thumb)
    end
end
