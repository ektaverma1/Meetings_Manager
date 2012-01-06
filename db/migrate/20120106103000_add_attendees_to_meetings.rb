class AddAttendeesToMeetings < ActiveRecord::Migration
  def up
    add_column :meetings, :attendees_ids, :text
  end
  def down
    remove_column :meetings, :attendees_ids
  end
end
