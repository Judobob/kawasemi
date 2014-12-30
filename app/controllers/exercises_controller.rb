class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  
  def index
    @exercises = Exercise.all
    respond_with(@exercises)
  end

  def show
    respond_with(@exercise)
  end

  def new
    @exercise = Exercise.new
    respond_to do |format|
      format.html { redirect_to root_path } #for my controller, i wanted it to be JS only
      format.js
    end
  end

  def edit
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
    #passed  
    else
    #errors
    @exercise.errors.full_messages
   
    end
    respond_to do |format|
        format.html { redirect_to root_path } #for my controller, i wanted it to be JS only
        format.js
      end  
  end

  def update
    @exercise.update(exercise_params)
    respond_with(@exercise)
  end

  def destroy
    @exercise.destroy
    respond_with(@exercise)
  end

  private
    def set_exercise
      @exercise = Exercise.find(params[:id])
    end

    def exercise_params
      params.require(:exercise).permit(:name, :description)
    end
end
