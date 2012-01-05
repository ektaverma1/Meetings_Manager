class MeetingType < ActiveRecord::Base

  def self.get_all_meeting_type
    find(:all,:select => ['id','name'])
  end
  
end
