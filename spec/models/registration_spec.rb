require 'spec_helper'

describe Registration do
  let!(:event){ FactoryGirl.create(:future_event, adult_fee: 20, child_fee: 7) }
  let!(:registration){ FactoryGirl.build(:registration, event_id: event.id) }
  describe 'participants' do
    it 'should validate at least one participant' do
      registration.save.should be_false
    end
  end
  describe 'calculate_registration_fee' do
    it 'should calculate the total registration fee' do
      registration.adults = 2
      registration.save
      registration.fee.should eq(40)
      registration.children.should eq(0)
    end
    it 'should calculate the total registration fee' do
      registration.adults = 2
      registration.children = 1
      registration.save
      registration.fee.should eq(47)
    end
  end
end
