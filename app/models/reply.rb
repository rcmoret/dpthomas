class Reply < ActiveRecord::Base
  validates_presence_of :content
  delegate :name, to: :member, prefix: true

  belongs_to :member
  belongs_to :discussion
  delegate :name, to: :member, prefix: true

  scope :recent_first, -> { order('created_at DESC') }

  alias_method :author, :member_name
end
