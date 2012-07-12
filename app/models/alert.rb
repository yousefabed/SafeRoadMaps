class Alert < ActiveRecord::Base
  attr_accessible :gis_message, :location_id, :message
    belongs_to :location
end
