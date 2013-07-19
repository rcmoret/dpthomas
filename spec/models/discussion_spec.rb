require 'spec_helper'

describe Discussion do
  describe 'author' do
    let!(:member){ FactoryGirl.create(:member, first_name: 'ryan', last_name: 'moret') }
    let!(:discussion){ FactoryGirl.create(:discussion, member_id: member.id) }
    it 'should return the name of the poster' do
      discussion.author.should eq('ryan moret')
    end
  end
end
