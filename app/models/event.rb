class Event < ActiveRecord::Base
  attr_accessible :title, :date, :location, :details
end
