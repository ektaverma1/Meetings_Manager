class Attendee < ActiveRecord::Base
  validates :name , :presence => true
  validates :mail , :presence => true
end
