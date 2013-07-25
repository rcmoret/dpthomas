FactoryGirl.define do
  factory :event do

    title 'Fundraiser'
    name '5k run'
    location 'Shelby Bottoms'
    details 'lots of fun'
    has_registration true
    adult_fee 30
    child_fee 10
    date 3.days.from_now

    factory :future_event do
      date { 3.days.from_now }
    end

    factory :past_event do
      date { 3.days.ago }
    end
  end
end
