class Attendee < ActiveRecord::Base
  has_and_belongs_to_many :meeting_types
  validates :name , :presence => true
  validates :mail , :presence => true
  
end
