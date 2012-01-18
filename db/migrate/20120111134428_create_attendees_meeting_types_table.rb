class CreateAttendeesMeetingTypesTable < ActiveRecord::Migration
  def up
    create_table :attendees_meeting_types, :id => false do |t|
      t.integer :attendee_id
      t.integer :meeting_type_id
    end
  end

  def down
    drop_table :attendees_meeting_types
  end
end
