class Event < ActiveRecord::Base
  validates_presence_of :title, :date, :location, :details
  has_many :registrations

  before_create :set_fees, if: :has_registration?

  scope :archived_events, -> { where('date < ?', Date.today).where(show_past_event: true) }
  scope :non_archived_events, -> { where('date < ?', Date.today).where(show_past_event: true) }
  scope :in_the_future, -> { where('date >= ?', Date.today) }

  private

  def set_fees
    self[:adult_fee] ||= 0
    self[:child_fee] ||= 0
  end
end
