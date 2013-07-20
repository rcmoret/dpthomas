Given /^the foundation has an? "(.*?)" service$/ do |service|
  FactoryGirl.create(:service, name: service)
end
