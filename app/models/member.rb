class Member < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :position_title, :image, :biography, :email

end
