class Registration < ActiveRecord::Base
  validates_presence_of :email

  validate :participants
  before_save :calculate_registration_fee

  belongs_to :event

  private

  def calculate_registration_fee
    (adults.to_i * event.adult_fee) + (children.to_i * event.child_fee)
  end

  def participants
    errors.add(:registration, 'must have 1 participant') if adults.nil? && children.nil?
  end
end
