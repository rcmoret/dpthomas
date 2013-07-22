class Event < ActiveRecord::Base
  attr_accessible :title, :date, :location, :details,
    :has_registration, :adult_fee, :child_fee

  before_save :set_fees, if: :has_registration?

  scope :in_the_future, where('date >= ?', Date.today)

  private

  def set_fees
    self.adult_fee ||= 0
    self.child_fee ||= 0
  end

end
