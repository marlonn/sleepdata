require 'spec_helper'

describe "processed_data/new.html.erb" do
  before(:each) do
    assign(:processed_datum, stub_model(ProcessedDatum,
      :period_label => "MyString",
      :begin => "MyString",
      :end => "MyString"
    ).as_new_record)
  end

  it "renders new processed_datum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => processed_data_path, :method => "post" do
      assert_select "input#processed_datum_period_label", :name => "processed_datum[period_label]"
      assert_select "input#processed_datum_begin", :name => "processed_datum[begin]"
      assert_select "input#processed_datum_end", :name => "processed_datum[end]"
    end
  end
end
