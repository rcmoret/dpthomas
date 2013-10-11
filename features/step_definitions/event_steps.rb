Given /^there is a future (.*?) event$/ do |event|
  FactoryGirl.create(:event, name: event, date: 1.month.from_now)
end

Given /^there is a past (.*?) event$/ do |event|
  FactoryGirl.create(:event, name: event, date: 2.month.ago)
end
