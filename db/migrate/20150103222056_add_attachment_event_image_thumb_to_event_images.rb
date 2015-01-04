class AddAttachmentEventImageThumbToEventImages < ActiveRecord::Migration
  def self.up
    change_table :event_images do |t|
      t.attachment :event_image_thumb
    end
  end

  def self.down
    remove_attachment :event_images, :event_image_thumb
  end
end
