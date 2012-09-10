require "uri"
require "net/http"
class SimulateController < ApplicationController

  def show
    	alert = Alert.new
    	alert.message = "Alert.Alert. You're approaching dangerous spot. Use caution." 
    	alert.location_id = 1 # Yousef device
    	alert.gis_message = 'simulation'
    	alert.save
      	uri = URI.parse('https://android.googleapis.com/gcm/send')
      	api_key = 'AIzaSyDnyXvByw2Q2qzCt5S-2MHV8J5fuTox5l4'
      	logger.info (alert.location.device)
      	googleReg ='APA91bEWdeqabLNpbLJCbVbhOLWH2j2KFgo2XWjPicXYljsL3IqJbNuzaHEO0Hrs6LEk_7vGdQ13Qb1K1VrjauLj06l1SQlqSfC7J9iF5g_4QKpORfuKCC_QyonFr-nkIL7hqkac6qYW5PLRSEM0f5AflnAc9eB-PQ'
      	# 'APA91bEZR7EvrwO_rtdcAMpz9e-QnZym52ZNfGilyUbW7_QxGwUImjqMtm8--ypv-YTsvCbfqd7zW813PJEOFVlcmO5GuQ7l6lNcrIP800NgjNEBaVL1bQYLyBUax_auyPZgWHp66GB2llUImZfzSRBPHk1gmwvkRw'
      	
    	params = "collapse_key=score_update&registration_id=#{googleReg}&data.url=#{alert_path(alert)}&data.message=#{alert.message}"
      	puts "Reg ID = #{googleReg}"
      	request = Net::HTTP::Post.new(uri.request_uri) 
     	request.add_field("Authorization", "key="+api_key)
     	#request.add_field("Content-Type", "application/json")
     	request.body = params
        res = Net::HTTP.new(uri.host, uri.port)                                         
        res.use_ssl = true                                                                                                          
       response =  res.start {|http| http.request(request) }
     	puts "Response #{response.code} #{response.message}: #{response.body}"
      respond_to do |format|
         format.xml { render :xml =>'<?xml version="1.0" encoding="UTF-8"?>
         <Response>
             <Hangup/>
         </Response>' }  
    end
    
    
  end
end
