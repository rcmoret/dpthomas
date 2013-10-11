require 'spec_helper'

describe Event do
  let!(:future_event){ FactoryGirl.create(:future_event) }
  let!(:past_event){ FactoryGirl.create(:past_event) }
  describe '.in_the_future' do
    it 'should return events in the future' do
      Event.count.should eq(2)
      Event.in_the_future.count.should eq(1)
    end
  end

  describe '.archived_events' do
    it 'should return events in the past' do
      Event.archived_events.count.should eq(1)
    end
  end

  describe '.non_archived_events' do
    let!(:past_event_to_show){ FactoryGirl.create(:past_event, show_past_event: true) }
    it 'should return only return events in the past with the show flag true' do
      Event.count.should eq(3)
      Event.non_archived_events.count.should eq(1)
    end
  end

  describe 'set_fees' do
    let!(:event){ FactoryGirl.build(:event, adult_fee: nil, child_fee: nil) }
    it 'should set the fees' do
      event.save
      event.adult_fee.should eq(0)
      event.child_fee.should eq(0)
    end
  end
end
