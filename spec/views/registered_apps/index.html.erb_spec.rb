require 'rails_helper'

RSpec.describe "registered_apps/index", type: :view do
  before(:each) do
    assign(:registered_apps, [
      RegisteredApp.create!(
        :name => "Name",
        :url => "Url"
      ),
      RegisteredApp.create!(
        :name => "Name",
        :url => "Url"
      )
    ])
  end

  it "renders a list of registered_apps" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
