class EventTimeImage < ActiveRecord::Base
  belongs_to :event_time
  belongs_to :event_images
end
