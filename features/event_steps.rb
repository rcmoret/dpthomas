Given /^there is a future (.*?) event with registration$/ do |event|
  FactoryGirl.create(:event, title: event, date: 1.month.from_now)
end
