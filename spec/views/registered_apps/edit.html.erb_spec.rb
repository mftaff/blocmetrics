require 'rails_helper'

RSpec.describe "registered_apps/edit", type: :view do
  before(:each) do
    @registered_app = assign(:registered_app, RegisteredApp.create!(
      :name => "MyString",
      :url => "MyString"
    ))
  end

  it "renders the edit registered_app form" do
    render

    assert_select "form[action=?][method=?]", registered_app_path(@registered_app), "post" do

      assert_select "input#registered_app_name[name=?]", "registered_app[name]"

      assert_select "input#registered_app_url[name=?]", "registered_app[url]"
    end
  end
end
