class EventTime < ActiveRecord::Base
  belongs_to :event, :foreign_key => "event_id"
  has_many :location_events
  has_many :locations, through: :location_events
  has_many :exercise_events, :dependent => :destroy
  has_many :exercises, through: :exercise_events
  has_many :user_event_times
  has_many :users, through: :user_event_times
  
  accepts_nested_attributes_for :event
  accepts_nested_attributes_for :users
  accepts_nested_attributes_for :exercise_events,:reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  
end
