require 'spec_helper'

describe Event do
  describe '.in_the_future' do
    let!(:future_event){ FactoryGirl.create(:future_event) }
    let!(:past_event){ FactoryGirl.create(:past_event) }
    it 'should return events in the future' do
      Event.count.should eq(2)
      Event.in_the_future.count.should eq(1)
    end
  end
end
