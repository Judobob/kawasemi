class Location < ActiveRecord::Base
  has_many :location_events
  has_many :event_times ,through: :location_events
end
