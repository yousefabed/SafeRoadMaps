require "uri"
require "net/http"

class LocationsController < ApplicationController

  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @locations }
    end
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    @location = Location.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @location }
    end
  end

  # GET /locations/new
  # GET /locations/new.json
  def new
    @location = Location.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @location }
    end
  end

  # GET /locations/1/edit
  def edit
    @location = Location.find(params[:id])
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new()
    @location.lat = 34.063938#params[:lat]
    @location.lng = -118.293204#params[:lng]
    
    temp = params[:device_uid]; 
    
    @device = Device.find_by_device_uid(temp.to_s)
    logger.info "device : "+@device['google_registration'].to_s
    if(!@device.nil?)
    @location.device_id = @device.id
    #call gis service
    url ="http://134.173.236.103/ArcGIS/rest/services/SRM_FARS_Data_Alert_Service/MapServer/0/query?text=&geometry=#{@location.lng}%2C#{@location.lat}&geometryType=esriGeometryPoint&inSR=4326&spatialRel=esriSpatialRelIntersects&relationParam=&objectIds=&where=&time=&returnIdsOnly=false&returnGeometry=false&maxAllowableOffset=&outSR=&outFields=Alert&f=pjson"
 #    url =  "http://134.173.236.103/ArcGIS/rest/services/SRM_FARS_Data_Alert_Service/MapServer/0/query?text=&geometry=#{@location.lng}%2C#{@location.lat}&f=pjson"
      x = Net::HTTP.get_response(URI.parse(url))
    json = JSON.parse(x.body)
    logger.info 'url' + url
    logger.info "GIS Full :" +x.body
    logger.info "GIS : "+json['features'].to_s
    if(!json['features'].empty?)
    
    a = send_notification(@device.id.to_s,'Alert')
    end
     respond_to  { head :no_content }
    
    end
   
  end

  # PUT /locations/1
  # PUT /locations/1.json
  def update
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to locations_url }
      format.json { head :no_content }
    end
  end
  
end
