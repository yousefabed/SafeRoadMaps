class ApplicationController < ActionController::Base
  protect_from_forgery
    
   def send2(mydevice, message)
    
  uri = URI.parse('https://android.googleapis.com/gcm/send')
  api_key = 'AIzaSyDnyXvByw2Q2qzCt5S-2MHV8J5fuTox5l4'
  logger.info mydevice.to_s
  @device = Device.find(mydevice)
  @message = message
   if(!@message.nil? && !@device.nil?)
    #	params = {'collapse_key' =>'score_update', 'registration_id' => @device.device_uid,'data.score' =>'5', 'data.message' =>"Don't worry"}
  		params = "collapse_key=score_update&registration_id=#{@device.google_registration}&data.score=5&data.message=#{@message}"
  		  puts "Reg ID = #{@device.google_registration}"
  	request = Net::HTTP::Post.new(uri.request_uri) 
 	request.add_field("Authorization", "key="+api_key)
 	#request.add_field("Content-Type", "application/json")
 	request.body = params
    res = Net::HTTP.new(uri.host, uri.port)                                         
    res.use_ssl = true                                                              
                                                   
   response =  res.start {|http| http.request(request) }
 	puts "Response #{response.code} #{response.message}: #{response.body}"
   	end
   	response.code
 end
  
end
