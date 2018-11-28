class Registration < ActiveRecord::Base
  validates_presence_of :email

  validate :participants
  before_save :set_registration_fee

  belongs_to :event
  delegate :adult_fee, :child_fee, to: :event

  def adults
    self[:adults].to_i
  end

  def children
    self[:children].to_i
  end

  private

  def set_registration_fee
    self.fee = (adults * adult_fee) + (children * child_fee)
  end

  def participants
    errors.add(:registration, 'must have 1 participant') if total_participants.zero?
  end

  def total_participants
    adults + children
  end
end
