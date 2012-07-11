class Location < ActiveRecord::Base
  attr_accessible :device_id, :lat, :lng, :source
end
