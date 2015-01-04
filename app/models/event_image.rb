class EventImage < ActiveRecord::Base
  has_attached_file :event_image_thumb, :styles => { }, :default_url => "/images/:style/missing.png"
  has_attached_file :event_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :event_image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :event_image_thumb, :content_type => /\Aimage\/.*\Z/
  has_many :event_times, through: :event_time_images
end
