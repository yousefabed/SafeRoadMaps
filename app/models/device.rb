class Device < ActiveRecord::Base
  attr_accessible :device_name, :device_uid, :google_registration
end
