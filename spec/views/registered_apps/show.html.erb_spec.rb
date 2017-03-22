require 'rails_helper'

RSpec.describe "registered_apps/show", type: :view do
  before(:each) do
    @registered_app = assign(:registered_app, RegisteredApp.create!(
      :name => "Name",
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Url/)
  end
end
