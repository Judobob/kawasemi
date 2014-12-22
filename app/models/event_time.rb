class EventTime < ActiveRecord::Base
  has_one :event
  has_many :location_events
  has_many :locations, through: :location_events
  has_many :excercise_events
  has_many :excercises, through: :exercise_events
  has_many :user_event_times
  has_many :users, through: :user_event_times
  
  
end
