require 'spec_helper'

describe "raw_data/index.html.erb" do
  before(:each) do
    assign(:raw_data, [
      stub_model(RawDatum,
        :timestamp => "MyText",
        :status => "Status"
      ),
      stub_model(RawDatum,
        :timestamp => "MyText",
        :status => "Status"
      )
    ])
  end

  it "renders a list of raw_data" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
