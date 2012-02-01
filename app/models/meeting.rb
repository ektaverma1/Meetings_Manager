class Meeting < ActiveRecord::Base
  
  belongs_to :meeting_type
  has_many :attendees
  #serialize :attendees_ids
  
  validates :name , :presence => true
  #validates :description , :presence => true
end
