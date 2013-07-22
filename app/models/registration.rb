class Registration < ActiveRecord::Base
  attr_accessible :event_id, :email, :adults, :children, :additional_info, :fee

  validates_presence_of :email

  validate :participants
  before_save :calculate_registration_fee

  belongs_to :event

  private

  def calculate_registration_fee
    self.adults ||= 0
    self.children ||= 0
    self.fee = ( self.adults * self.event.adult_fee) + ( self.children * self.event.child_fee )
  end

  def participants
    errors.add(:registration, 'must have 1 participant') if self.adults.nil? && self.children.nil?
  end

end
