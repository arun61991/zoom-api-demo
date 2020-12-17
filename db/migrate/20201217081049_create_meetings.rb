class CreateMeetings < ActiveRecord::Migration[5.0]
  def change
    create_table :meetings do |t|
      t.string :topic
      t.integer :user_id
      t.integer :meeting_type
      t.string :start_time
      t.integer :duration
      t.string :password
      t.string :zoom_meeting_id

      t.timestamps
    end
  end
end
