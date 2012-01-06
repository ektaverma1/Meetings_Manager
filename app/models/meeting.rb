class Meeting < ActiveRecord::Base
  belongs_to :meeting_type
  serialize :attendees_ids
end
