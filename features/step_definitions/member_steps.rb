Given /^I am a member; my email is "(.*?)"$/ do |email|
  FactoryGirl.create(:member, email: email)
end

Given /^I am a member; my email is "(.*?)"; my profile is complete$/ do |email|
  FactoryGirl.create(:member_with_profile, email: email)
end

Given /^I (?:|am )sign(?:|ed) in as "(.*?)"$/ do |email|
  steps %{
    Given I am a member; my email is "#{email}"; my profile is complete
    And I am on the sign in page
    And I fill in "#{email}" for "Email"
    And I fill in "password" for "Password"
    And I click "Sign In"
  }
end

Given /^I sign out$/ do
  click_link 'sign out'
end
