require 'spec_helper'

describe "devices/new" do
  before(:each) do
    assign(:device, stub_model(Device,
      :device_name => "MyString",
      :device_uid => "MyString",
      :google_registration => "MyString"
    ).as_new_record)
  end

  it "renders new device form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => devices_path, :method => "post" do
      assert_select "input#device_device_name", :name => "device[device_name]"
      assert_select "input#device_device_uid", :name => "device[device_uid]"
      assert_select "input#device_google_registration", :name => "device[google_registration]"
    end
  end
end
