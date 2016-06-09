require 'spec_helper'

describe "holidays/new.html.erb" do
  before(:each) do
    assign(:holiday, stub_model(Holiday,
      :date => "MyString"
    ).as_new_record)
  end

  it "renders new holiday form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => holidays_path, :method => "post" do
      assert_select "input#holiday_date", :name => "holiday[date]"
    end
  end
end
