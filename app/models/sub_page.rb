class SubPage < ActiveRecord::Base
  attr_accessible :content, :page_id, :title

  has_one :page
end
