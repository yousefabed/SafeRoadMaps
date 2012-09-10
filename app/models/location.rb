class Location < ActiveRecord::Base
  attr_accessible :device_id, :lat, :lng, :source
  belongs_to :device
end
# == Schema Information
#
# Table name: locations
#
#  id         :integer         not null, primary key
#  device_id  :integer
#  lat        :float
#  lng        :float
#  source     :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

