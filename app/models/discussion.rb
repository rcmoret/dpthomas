class Discussion < ActiveRecord::Base

  attr_accessible :topic, :content, :member_id

  belongs_to :member

  def author
    self.member.name
  end

end
