require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe DevicesController do

  # This should return the minimal set of attributes required to create a valid
  # Device. As you add validations to Device, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {:device_name => 'test device' , :device_uid => 'abc', :phone_number => '95174333333'}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DevicesController. Be sure to keep this updated too.
  def valid_session
    {"saferoadmapkey" => session["saferoadmapkey"]}
  end

  describe "GET index" do
    it "assigns all devices as @devices" do
      device = Device.create! valid_attributes
      get :index, {}, valid_session
      assigns(:devices).should eq([device])
    end
  end

  describe "GET show" do
    it "assigns the requested device as @device" do
      device = Device.create! valid_attributes
      get :show, {:id => device.to_param}, valid_session
      assigns(:device).should eq(device)
    end
  end

  describe "GET new" do
    it "assigns a new device as @device" do
      get :new, {}, valid_session
      assigns(:device).should be_a_new(Device)
    end
  end

  describe "GET edit" do
    it "assigns the requested device as @device" do
      device = Device.create! valid_attributes
      get :edit, {:id => device.to_param}, valid_session
      assigns(:device).should eq(device)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      # it "creates a new Device" do
      #               expect {
      #                 post :create, {:device => valid_attributes}, valid_session
      #               }.to change(Device, :count).by(1)
      #             end

      it "assigns a newly created device as @device" do
        post :create, {:device => valid_attributes}, valid_session
        assigns(:device).should be_a(Device)
        assigns(:device).should be_persisted
      end

      it "redirects to the created device" do
        post :create, {:device => valid_attributes}, valid_session
        response.should redirect_to(Device.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved device as @device" do
        # Trigger the behavior that occurs when invalid params are submitted
        Device.any_instance.stub(:save).and_return(false)
        post :create, {:device => {}}, valid_session
        assigns(:device).should be_a_new(Device)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Device.any_instance.stub(:save).and_return(false)
        post :create, {:device => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested device" do
        device = Device.create! valid_attributes
        # Assuming there are no other devices in the database, this
        # specifies that the Device created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Device.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => device.to_param, :device => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested device as @device" do
        device = Device.create! valid_attributes
        put :update, {:id => device.to_param, :device => valid_attributes}, valid_session
        assigns(:device).should eq(device)
      end

      it "redirects to the device" do
        device = Device.create! valid_attributes
        put :update, {:id => device.to_param, :device => valid_attributes}, valid_session
        response.should redirect_to(device)
      end
    end

    describe "with invalid params" do
      it "assigns the device as @device" do
        device = Device.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Device.any_instance.stub(:save).and_return(false)
        put :update, {:id => device.to_param, :device => {}}, valid_session
        assigns(:device).should eq(device)
      end

      it "re-renders the 'edit' template" do
        device = Device.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Device.any_instance.stub(:save).and_return(false)
        put :update, {:id => device.to_param, :device => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested device" do
      device = Device.create! valid_attributes
      expect {
        delete :destroy, {:id => device.to_param}, valid_session
      }.to change(Device, :count).by(-1)
    end

    it "redirects to the devices list" do
      device = Device.create! valid_attributes
      delete :destroy, {:id => device.to_param}, valid_session
      response.should redirect_to(devices_url)
    end
  end

end
