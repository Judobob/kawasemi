class ExerciseEvent < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :event_time
end
