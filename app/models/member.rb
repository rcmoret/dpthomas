class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :first_name, :last_name, :position_title, :image, :biography

  mount_uploader :image, ImageUploader

  scope :completed_profiles, where('first_name IS NOT NULL').where('last_name IS NOT NULL').where('position_title IS NOT NULL').where('biography IS NOT NULL')

  def incomplete_profile?
    [self.first_name, self.last_name, self.position_title, self.biography].include? nil
  end

  def name
    if self.first_name && self.last_name
      "#{ self.first_name } #{ self.last_name }"
    else
      self.email
    end
  end

end
