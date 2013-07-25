Given /^there is a future (.*?) event$/ do |event|
  FactoryGirl.create(:event, name: event, date: 1.month.from_now)
end
