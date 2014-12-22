class CreateUserEventTimes < ActiveRecord::Migration
  def change
    create_table :user_event_times do |t|
      t.integer :user_id
      t.integer :event_time_id
      t.integer :priority

      t.timestamps
    end
  end
end
