require 'spec_helper'

describe Device do
  it "should create a valid device" do
    Device.create!(:device_name => 'Test Device', :device_uid => 'abc',:google_registration => 'long string', :phone_number => '9099998788')
  end
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

