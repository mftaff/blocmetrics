require 'rails_helper'

RSpec.describe "registered_apps/new", type: :view do
  before(:each) do
    assign(:registered_app, RegisteredApp.new(
      :name => "MyString",
      :url => "MyString"
    ))
  end

  it "renders new registered_app form" do
    render

    assert_select "form[action=?][method=?]", registered_apps_path, "post" do

      assert_select "input#registered_app_name[name=?]", "registered_app[name]"

      assert_select "input#registered_app_url[name=?]", "registered_app[url]"
    end
  end
end
