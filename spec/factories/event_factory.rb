FactoryGirl.define do
  factory :event do

    title 'Fundraiser'
    location 'Shelby Bottoms'
    details 'lots of fun'

    factory :future_event do
      date { 3.days.from_now }
    end

    factory :past_event do
      date { 3.days.ago }
    end
  end
end
