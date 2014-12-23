class Event < ActiveRecord::Base
  has_many :event_times
  validates_presence_of :name,:description
end
