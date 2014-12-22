class CreateLocationEvents < ActiveRecord::Migration
  def change
    create_table :location_events do |t|
      t.integer :location_id
      t.integer :event_time_id

      t.timestamps
    end
  end
end
