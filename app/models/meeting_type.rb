class MeetingType < ActiveRecord::Base
  has_many :meetings

  validates :name , :presence => true

  def self.get_all_meeting_type
    find(:all,:select => ['id','name'])
  end
  
end
