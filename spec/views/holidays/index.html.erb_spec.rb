require 'spec_helper'

describe "holidays/index.html.erb" do
  before(:each) do
    assign(:holidays, [
      stub_model(Holiday,
        :date => "Date"
      ),
      stub_model(Holiday,
        :date => "Date"
      )
    ])
  end

  it "renders a list of holidays" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Date".to_s, :count => 2
  end
end
