class Location < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :region
end
