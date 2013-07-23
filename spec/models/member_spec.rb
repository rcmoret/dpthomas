require 'spec_helper'

describe Member do

  let!(:member){ FactoryGirl.create(:member, email: 'ryan@example.com') }

  describe '.incomplete_profile?' do
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

  describe 'completed_profiles' do
    let!(:profile){ FactoryGirl.create(:member_with_profile, email: "new@example.com") }
    it 'should return only the first member' do
      Member.count.should eq(2)
      Member.completed_profiles.count.should eq(1)
    end
  end

  describe 'name' do
    it 'should handle return email or concatonated name' do
      member.name.should eq('ryan@example.com')
      member.update_attribute(:first_name, 'ryan')
      member.update_attribute(:last_name, 'moret')
      member.name.should eq('ryan moret')
    end
  end

  describe 'phone number' do
    it 'should validate only valid phone numbers' do
      member.phone = '256-534-8451'
      member.save
      member.phone.should eq('2565348451')
    end
  end

end
