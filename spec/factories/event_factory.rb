FactoryGirl.define do
  factory :event do

    title 'Fundraiser'
    location 'Shelby Bottoms'
    details 'lots of fun'

    factory :future_event do
      date { 3.days.from_now }
      has_registration true
      adult_fee 30
      child_fee 10
    end

    factory :past_event do
      date { 3.days.ago }
    end
  end
end
