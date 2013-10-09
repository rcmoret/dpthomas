class Event < ActiveRecord::Base
  attr_accessible :title, :date, :location, :details,
    :has_registration, :adult_fee, :child_fee, :title, :name,
    :show_past_event

  validates_presence_of :title, :date, :location, :details

  has_many :registrations

  before_save :set_fees, if: :has_registration?

  scope :past_events_to_show, where('date < ?', Date.today).where(show_past_event: true)
  scope :in_the_future, where('date >= ?', Date.today)

  private

  def set_fees
    self.adult_fee ||= 0
    self.child_fee ||= 0
  end

end
