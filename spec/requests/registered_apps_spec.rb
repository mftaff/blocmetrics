require 'rails_helper'

RSpec.describe "RegisteredApps", type: :request do
  describe "GET /registered_apps" do
    it "works! (now write some real specs)" do
      get registered_apps_path
      expect(response).to have_http_status(200)
    end
  end
end
