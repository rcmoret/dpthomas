class EmailList < ActiveRecord::Base
  attr_accessible :email_address, :first_name, :last_name
  validates_presence_of :email_address, :first_name, :last_name
end
