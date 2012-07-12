require 'spec_helper'

describe "alerts/index" do
  before(:each) do
    assign(:alerts, [
      stub_model(Alert,
        :message => "Message",
        :location_id => 1,
        :gis_message => "MyText"
      ),
      stub_model(Alert,
        :message => "Message",
        :location_id => 1,
        :gis_message => "MyText"
      )
    ])
  end

  it "renders a list of alerts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Message".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
