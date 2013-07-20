class Registration < ActiveRecord::Base
  attr_accessible :event_id, :email, :adults, :children, :additional_info

  belongs_to :event

end
