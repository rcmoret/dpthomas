When /^"(.*?)" has registered for this event with (\d+) child(?:|ren) and (\d+) adults?$/ do |email, children, adults|
  event = Event.first
  FactoryGirl.create(:registration, email: email, adults: adults, children: children, event_id: event.id)
end
