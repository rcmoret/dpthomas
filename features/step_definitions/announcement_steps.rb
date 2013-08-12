Given /^there is an announcment about "(.*?)"$/ do |announcement|
  FactoryGirl.create(:announcement, announcement: announcement)
end
