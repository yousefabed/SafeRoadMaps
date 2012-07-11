require 'spec_helper'

describe "devices/show" do
  before(:each) do
    @device = assign(:device, stub_model(Device,
      :device_name => "Device Name",
      :device_uid => "Device Uid",
      :google_registration => "Google Registration"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Device Name/)
    rendered.should match(/Device Uid/)
    rendered.should match(/Google Registration/)
  end
end
