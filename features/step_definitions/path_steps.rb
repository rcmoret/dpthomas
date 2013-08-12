def path_to(page_name)
  case page_name
  when /^the home\s?page$/
    '/'
  when /^the member sign up page$/
    new_member_registration_path
  when /^my member profile page$/
    edit_member_path(Member.last.id)
  when /^the members dashboard(?:| page)$/
    members_dashboard_path
  when /^the sign in page$/
    new_member_session_path
  when /^the about the board page$/
    members_path
  when /^the new event page$/
    new_event_path
  when /^the events page$/
    events_path
  when /^the new discussion page$/
    new_discussion_path
  when /^the main discussion page$/
    discussions_path
  when /^the new service page$/
    new_service_path
  when /^the services index$/
    services_path
  when /^the email listing index$/
    email_listings_path
  when /^the email list sign up page$/
    new_email_listing_path
  when /^the event registration page$/
    new_event_registration_path
  when /^the new announcement page$/
    new_announcement_path
  when /^the announcement list page$/
    announcements_path
  else
    raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
      "Now, go and add a mapping in #{__FILE__}"
  end
end

When /^I go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

Given /^I am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then /^I should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end

Then /^I should be (?:directed|redirected) to (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end
