require 'spec_helper'

describe Reply do
  describe 'author' do
    let!(:member){ FactoryGirl.create(:member, first_name: 'ryan', last_name: 'moret') }
    let!(:reply){ FactoryGirl.create(:reply, member_id: member.id) }
    it 'should return the name of the poster' do
      reply.author.should eq('ryan moret')
    end
  end
end
