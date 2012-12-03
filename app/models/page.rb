class Page < ActiveRecord::Base
  attr_accessible :content, :title
  has_many :sub_page
end
