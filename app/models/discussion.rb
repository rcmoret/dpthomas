class Discussion < ActiveRecord::Base
  validates_presence_of :topic, :content

  belongs_to :member
  has_many :replies, dependent: :destroy
  delegate :name, to: :member, prefix: true

  scope :recent_first, -> {  order('created_at DESC') }
  alias_method :author, :member_name
end
