class Device < ActiveRecord::Base
  attr_accessible :device_name, :device_uid, :google_registration,:phone_number
  has_many :locations
  validates :phone_number, :presence => true
  
end
# == Schema Information
#
# Table name: devices
#
#  id                  :integer         not null, primary key
#  device_name         :string(255)
#  device_uid          :string(255)
#  google_registration :string(255)
#  created_at          :datetime        not null
#  updated_at          :datetime        not null
#  phone_number        :string(255)
#

