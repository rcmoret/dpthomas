Given /^I have posted a discussion topic: "(.*?)", as "(.*?)"$/ do |topic, email|
  author = Member.where(email: email).first
  FactoryGirl.create(:discussion, topic: topic, member_id: author.id)
end

Given /^there (?:was|were) (\d+) discussions? posted earlier this week$/ do |number|
  author = FactoryGirl.create(:member, email: 'candace@example.com')
  number.to_i.times do
    FactoryGirl.create(:discussion, member_id: author.id, created_at: 4.days.ago)
  end
end
