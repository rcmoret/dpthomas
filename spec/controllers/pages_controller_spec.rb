require 'spec_helper'

describe 'PagesController' do
  it "shows the header at the home page" do
    visit '/'
    page.should have_css("h1", text: "Welcome to the DP Thomas Foundation Home Page")
  end
end
