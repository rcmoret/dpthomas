class Event < ActiveRecord::Base
  attr_accessible :title, :date, :location, :details

  scope :in_the_future, where('date >= ?', Date.today)
end
