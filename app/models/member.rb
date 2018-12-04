class Member < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :email
  before_save :strip_phone_number

  mount_uploader :image, ImageUploader

  scope :by_rank, -> { order('rank ASC') }

  scope :completed_profiles, -> {
    where('first_name IS NOT NULL AND last_name IS NOT NULL AND position IS NOT NULL AND biography IS NOT NULL')
  }

  def incomplete_profile?
    [first_name, last_name, position].any?(&:nil?)
  end

  def name
    if first_name && last_name
      "#{first_name} #{last_name}"
    else
      email
    end
  end

  def image_name
    return if self[:image_name].nil? || self[:image_name].empty?
    "member_profiles/#{self[:image_name]}"
  end

  private

  def strip_phone_number
    self.phone = phone.gsub(/\D/, '') unless phone.nil?
  end

end
