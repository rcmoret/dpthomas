class Service < ActiveRecord::Base
  validates_presence_of :name, :details
end
