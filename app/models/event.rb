class Event < ActiveRecord::Base
  attr_accessible :title, :date, :location, :details,
    :has_registration, :adult_fee, :child_fee

  scope :in_the_future, where('date >= ?', Date.today)

end
