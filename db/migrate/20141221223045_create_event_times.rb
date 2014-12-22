class CreateEventTimes < ActiveRecord::Migration
  def change
    create_table :event_times do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :max_participants

      t.timestamps
    end
  end
end
