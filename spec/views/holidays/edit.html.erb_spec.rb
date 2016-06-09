require 'spec_helper'

describe "holidays/edit.html.erb" do
  before(:each) do
    @holiday = assign(:holiday, stub_model(Holiday,
      :date => "MyString"
    ))
  end

  it "renders the edit holiday form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => holidays_path(@holiday), :method => "post" do
      assert_select "input#holiday_date", :name => "holiday[date]"
    end
  end
end
