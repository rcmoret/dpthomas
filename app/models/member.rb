class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :email
  before_save :strip_phone_number

  attr_accessible :email, :password, :password_confirmation, :remember_me, :public_email,
                  :first_name, :last_name, :position, :image, :biography, :phone

  mount_uploader :image, ImageUploader

  scope :by_rank, order('rank ASC')

  scope :completed_profiles, where('first_name IS NOT NULL').where('last_name IS NOT NULL').where('position IS NOT NULL').where('biography IS NOT NULL')

  def incomplete_profile?
    [self.first_name, self.last_name, self.position].include? nil
  end

  def name
    if self.first_name && self.last_name
      "#{ self.first_name } #{ self.last_name }"
    else
      self.email
    end
  end

  private

  def strip_phone_number
    self.phone = self.phone.gsub(/\D/, '') unless self.phone.nil?
  end

end
