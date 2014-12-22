class ExerciseEvent < ActiveRecord::Base
  belongs_to :excercise
  belongs_to :event_time
end
