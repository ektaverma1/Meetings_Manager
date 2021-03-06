class MeetingType < ActiveRecord::Base
  has_many :meetings
  has_and_belongs_to_many :attendees
  validates :name , :presence => true

  scope :attendee ,lambda { |id| {:conditions => ["attendee_id = ?", id]} }
  def self.get_all_meeting_type
    find(:all,:select => ['id','name'])
  end
  
end
