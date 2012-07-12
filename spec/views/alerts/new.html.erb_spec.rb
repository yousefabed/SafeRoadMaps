require 'spec_helper'

describe "alerts/new" do
  before(:each) do
    assign(:alert, stub_model(Alert,
      :message => "MyString",
      :location_id => 1,
      :gis_message => "MyText"
    ).as_new_record)
  end

  it "renders new alert form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => alerts_path, :method => "post" do
      assert_select "input#alert_message", :name => "alert[message]"
      assert_select "input#alert_location_id", :name => "alert[location_id]"
      assert_select "textarea#alert_gis_message", :name => "alert[gis_message]"
    end
  end
end
