class Reply < ActiveRecord::Base
  attr_accessible :content, :member_id, :discussion_id

  validates_presence_of :content

  belongs_to :member
  belongs_to :discussion

  scope :recent_first, order('created_at DESC')

  def author
    self.member.name
  end

end
