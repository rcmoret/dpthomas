class Discussion < ActiveRecord::Base
  attr_accessible :topic, :content, :member_id

  validates_presence_of :topic, :content

  belongs_to :member

  has_many :replies, dependent: :destroy

  scope :recent_first, order('created_at DESC')

  def author
    self.member.name
  end

end
