require 'spec_helper'

describe Member do
  describe '.incomplete_profile?' do
    let!(:member){ FactoryGirl.create(:member) }
    it 'should return false if any required information is missing' do
      member.incomplete_profile?.should be_true
      member.update_attribute(:first_name, 'ryan')
      member.incomplete_profile?.should be_true
      member.update_attribute(:last_name, 'moret')
      member.incomplete_profile?.should be_true
      member.update_attribute(:position_title, 'consultant')
      member.incomplete_profile?.should be_true
      member.update_attribute(:biography, 'i was born...')
      member.incomplete_profile?.should be_false
    end
  end
end
