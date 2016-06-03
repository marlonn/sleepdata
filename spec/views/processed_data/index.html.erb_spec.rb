require 'spec_helper'

describe "processed_data/index.html.erb" do
  before(:each) do
    assign(:processed_data, [
      stub_model(ProcessedDatum,
        :period_label => "Period Label",
        :begin => "Begin",
        :end => "End"
      ),
      stub_model(ProcessedDatum,
        :period_label => "Period Label",
        :begin => "Begin",
        :end => "End"
      )
    ])
  end

  it "renders a list of processed_data" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Period Label".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Begin".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "End".to_s, :count => 2
  end
end
