class Registration < ActiveRecord::Base
  attr_accessible :event_id, :email, :adults, :children, :additional_info, :fee

  validates_presence_of :email, :adults, :children

  before_save :calculate_registration_fee

  belongs_to :event

  private

  def calculate_registration_fee
    adult_fee = self.event.adult_fee || 0
    child_fee = self.event.child_fee || 0
    self.fee = ( self.adults * adult_fee) + ( self.children * child_fee )
  end

end
