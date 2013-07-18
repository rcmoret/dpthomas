Given /^I am a member; my email is "(.*?)"$/ do |email|
  FactoryGirl.create(:member, email: email)
end

Given /^I am a member; my email is "(.*?)"; my profile is complete$/ do |email|
  FactoryGirl.create(:member_with_profile, email: email)
end
