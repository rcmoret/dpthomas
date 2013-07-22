require 'spec_helper'

describe Registration do
  describe 'calculate_registration_fee' do
    let!(:event){ FactoryGirl.create(:future_event, adult_fee: 20, child_fee: 7) }
    let!(:registration){ FactoryGirl.build(:registration, event_id: event.id, adults: 2, children: 1) }
    it 'should calculate the total registration fee' do
      registration.save
      registration.fee.should eq(47)
    end
  end
end
