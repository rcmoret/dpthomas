class Discussion < ActiveRecord::Base

  attr_accessible :topic, :content, :member_id

  belongs_to :member
  has_many :replies

  scope :recent_first, order('created_at DESC')

  def author
    self.member.name
  end

end
