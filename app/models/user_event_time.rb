class UserEventTime < ActiveRecord::Base
  belongs_to :users
  belongs_to :event_time
end
