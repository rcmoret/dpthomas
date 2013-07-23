class Service < ActiveRecord::Base
  attr_accessible :name, :details

  validates_presence_of :name, :details
end
