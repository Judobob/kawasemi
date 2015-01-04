class CreateEventImages < ActiveRecord::Migration
  def change
    create_table :event_images do |t|
      t.string :alt_text
      t.string :description
      t.attachment :event_image

      t.timestamps
    end
  end
end
