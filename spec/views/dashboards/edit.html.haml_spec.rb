require 'spec_helper'

describe "dashboards/edit" do
  before(:each) do
    @dashboard = assign(:dashboard, stub_model(Dashboard,
      :admin => "MyString",
      :developer => "MyString"
    ))
  end

  it "renders the edit dashboard form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", dashboard_path(@dashboard), "post" do
      assert_select "input#dashboard_admin[name=?]", "dashboard[admin]"
      assert_select "input#dashboard_developer[name=?]", "dashboard[developer]"
    end
  end
end
