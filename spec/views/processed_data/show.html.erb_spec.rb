require 'spec_helper'

describe "processed_data/show.html.erb" do
  before(:each) do
    @processed_datum = assign(:processed_datum, stub_model(ProcessedDatum,
      :period_label => "Period Label",
      :begin => "Begin",
      :end => "End"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Period Label/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Begin/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/End/)
  end
end
