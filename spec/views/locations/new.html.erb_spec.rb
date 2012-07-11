require 'spec_helper'

describe "locations/new" do
  before(:each) do
    assign(:location, stub_model(Location,
      :device_id => "",
      :lat => "",
      :lng => "",
      :source => "MyString"
    ).as_new_record)
  end

  it "renders new location form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => locations_path, :method => "post" do
      assert_select "input#location_device_id", :name => "location[device_id]"
      assert_select "input#location_lat", :name => "location[lat]"
      assert_select "input#location_lng", :name => "location[lng]"
      assert_select "input#location_source", :name => "location[source]"
    end
  end
end
