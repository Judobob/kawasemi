class CreateEventTimeImages < ActiveRecord::Migration
  def change
    create_table :event_time_images do |t|
      t.integer :event_image_id
      t.integer :event_time_id

      t.timestamps
    end
  end
end
