class UserEventTimesController < ApplicationController
  before_action :set_user_event_time, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  def create
    new_user_event_times_params=user_event_times_params
    new_user_event_times_params[:user_id] = current_user.id
    @user_event_time = UserEventTime.new(new_user_event_times_params)
    if @user_event_time.save
    #passed  
    else
    #errors
    @user_event_time.errors.full_messages
   
    end
    respond_to do |format|
        format.html { redirect_to root_path } #for my controller, i wanted it to be JS only
        format.js
      end  
  end
  
  def destroy
    @user_event_time.destroy
    respond_to do |format|
        format.html { redirect_to root_path } #for my controller, i wanted it to be JS only
        format.js
      end  
  end


  private
    def set_user_event_time
      @user_event_time = UserEventTime.find(params[:id])
    end

    def user_event_times_params
      params.require(:user_event_time).permit(:event_time_id, :user_id)
    end

end