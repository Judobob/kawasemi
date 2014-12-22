class Exercise < ActiveRecord::Base
  has_many :excercise_events
  has_many :event_times, through: :excercise_events
end
