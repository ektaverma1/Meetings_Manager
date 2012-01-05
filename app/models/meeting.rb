class Meeting < ActiveRecord::Base
  belongs_to :meeting_type
  has_many :attendees
end
