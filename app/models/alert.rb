class Alert < ActiveRecord::Base
  attr_accessible :gis_message, :location_id, :message, :alert_type
    belongs_to :location
end
# == Schema Information
#
# Table name: alerts
#
#  id          :integer         not null, primary key
#  message     :string(255)
#  location_id :integer
#  gis_message :text
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  alert_type  :text

