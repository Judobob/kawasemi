class Exercise < ActiveRecord::Base
  has_many :exercise_events
  has_many :event_times, through: :excercise_events
end
