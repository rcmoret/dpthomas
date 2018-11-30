class Announcement < ActiveRecord::Base
  validates_presence_of :announcement
  scope :by_priority, -> { order('priority ASC') }
end
