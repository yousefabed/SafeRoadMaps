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
    @location.lat = params[:lat] #34.063938
    @location.lng = params[:lng] #-118.293204
    temp = params[:device_uid];   
    @device = Device.find_by_device_uid(temp.to_s)
    logger.info "device : "+@device['google_registration'].to_s
    if(!@device.nil?)
		@location.device_id = @device.id
		@location.save
		#call gis service
		alert = query_gis_server(@location)
	    if(alert) # if there is an alert send notification 
   		 	a = send_notification(alert)
   		 	logger.info 'message sent ' + a
   		 end
    end
     respond_to  { head :no_content }   
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
