class CreateExerciseEvents < ActiveRecord::Migration
  def change
    create_table :exercise_events do |t|
      t.integer :exercise_id
      t.integer :event_time_id

      t.timestamps
    end
  end
end
