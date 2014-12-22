class LocationEvent < ActiveRecord::Base
  belongs_to :locations
  belongs_to :event_times
end
