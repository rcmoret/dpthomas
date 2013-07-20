require 'spec_helper'

describe Discussion do
  let!(:member){ FactoryGirl.create(:member, first_name: 'ryan', last_name: 'moret') }
  let!(:discussion){ FactoryGirl.create(:discussion, member_id: member.id) }
  describe 'author' do
    it 'should return the name of the poster' do
      discussion.author.should eq('ryan moret')
    end
  end
  describe 'destroy' do
    let!(:reply){ FactoryGirl.create(:reply, member_id: member.id, discussion_id: discussion.id) }
    it 'should destroy associated replies' do
      discussion.destroy
      Reply.count.should eq(0)
    end
  end
end
