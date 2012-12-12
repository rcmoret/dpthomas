def path_to(page_name)
  case page_name
  when /^the home\s?page$/
    '/'
  when /^the email sign up\spage$/
    '/email'
  when /^the email list\spage$/
    '/email_list'
  else
    raise "Can't find mappting from \"#{page_name}\" to a path.\n" +
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
