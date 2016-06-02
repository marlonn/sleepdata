require 'spec_helper'

describe "raw_data/new.html.erb" do
  before(:each) do
    assign(:raw_datum, stub_model(RawDatum,
      :timestamp => "MyText",
      :status => "MyString"
    ).as_new_record)
  end

  it "renders new raw_datum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => raw_data_path, :method => "post" do
      assert_select "textarea#raw_datum_timestamp", :name => "raw_datum[timestamp]"
      assert_select "input#raw_datum_status", :name => "raw_datum[status]"
    end
  end
end
