require 'spec_helper'

describe "dashboards/index" do
  before(:each) do
    assign(:dashboards, [
      stub_model(Dashboard,
        :admin => "Admin",
        :developer => "Developer"
      ),
      stub_model(Dashboard,
        :admin => "Admin",
        :developer => "Developer"
      )
    ])
  end

  it "renders a list of dashboards" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Admin".to_s, :count => 2
    assert_select "tr>td", :text => "Developer".to_s, :count => 2
  end
end
