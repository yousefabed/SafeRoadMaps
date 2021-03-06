class ApplicationController < ActionController::Base
  protect_from_forgery  
  def send_notification(alert)
  	uri = URI.parse('https://android.googleapis.com/gcm/send')
  	api_key = 'AIzaSyDnyXvByw2Q2qzCt5S-2MHV8J5fuTox5l4'
  	logger.info alert_path(alert)
	params = "collapse_key=score_update&registration_id=#{alert.location.device.google_registration}&data.url=#{alert_path(alert)}&data.alertType=#{alert.alert_type}&data.message=#{alert.message}"
	if (alert.gis_message.nil?)
	  	params = "collapse_key=score_update&registration_id=#{alert.location.device.google_registration}&data.url=/pages/safe&data.alertType=#{alert.alert_type}&data.message=#{alert.message}"
  	puts "Reg ID = #{alert.location.device.google_registration}"
	end
		logger.info params
  	request = Net::HTTP::Post.new(uri.request_uri) 
 	request.add_field("Authorization", "key="+api_key)
 	#request.add_field("Content-Type", "application/json")
 	request.body = params
    res = Net::HTTP.new(uri.host, uri.port)                                         
    res.use_ssl = true                                                                                                          
   response =  res.start {|http| http.request(request) }
 	puts "Response #{response.code} #{response.message}: #{response.body}"
   	response.code
 end
 def query_gis_server(location)
 	url ="http://134.173.236.103/ArcGIS/rest/services/SRM_FARS_Data_Alert_Service/MapServer/0/query?text=&geometry=#{location.lng}%2C#{location.lat}&geometryType=esriGeometryPoint&inSR=4326&spatialRel=esriSpatialRelIntersects&relationParam=&objectIds=&where=&time=&returnIdsOnly=false&returnGeometry=false&maxAllowableOffset=&outSR=&outFields=Alert&f=pjson"
	x = Net::HTTP.get_response(URI.parse(url))
	json = JSON.parse(x.body)
	logger.info 'gis server responded with' + x.code
    if(!json['features'].empty?)
    	alert = Alert.new
    	alert.message = "Alert.Alert. You're approaching dangerous spots. Use caution." 
    	alert.location_id = location.id
    	alert.gis_message = json['features'].to_s
    	alert.alert_type = "Red"
    	alert.save
    	alert
    else 
      alert = Alert.new
      	alert.message = "You've exited the danger zone." 
      	alert.location_id = location.id
      	alert.gis_message = nil
      	alert.alert_type = "Yellow"
      	alert.save
      	alert
    end
 end

  
 
 
  
end
