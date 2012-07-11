require 'spec_helper'

describe "devices/index" do
  before(:each) do
    assign(:devices, [
      stub_model(Device,
        :device_name => "Device Name",
        :device_uid => "Device Uid",
        :google_registration => "Google Registration"
      ),
      stub_model(Device,
        :device_name => "Device Name",
        :device_uid => "Device Uid",
        :google_registration => "Google Registration"
      )
    ])
  end

  it "renders a list of devices" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Device Name".to_s, :count => 2
    assert_select "tr>td", :text => "Device Uid".to_s, :count => 2
    assert_select "tr>td", :text => "Google Registration".to_s, :count => 2
  end
end
