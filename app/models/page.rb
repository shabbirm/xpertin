class Page < ActiveRecord::Base
  validates_presence_of :name,:title,:body
end
