require 'spec_helper'
describe 'PagesController' do
  before(:each) do
    load "#{ Rails.root }/db/seeds.rb"
  end
  it "shows the header at the home page" do
    visit '/'
    page.should have_css("h1", :text => "Home")
    page.should have_content("Join the email list")
    page.should have_content("Events")
    page.should have_content("About Us")
    page.should have_content("Donate")
    page.should have_content("Services")
  end
  it "has links and they work" do
    visit '/'
    click_link_or_button "Events"
    assert_equal '/pages.7', current_path
  end
end