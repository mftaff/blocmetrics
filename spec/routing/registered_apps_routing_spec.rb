require "rails_helper"

RSpec.describe RegisteredAppsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/registered_apps").to route_to("registered_apps#index")
    end

    it "routes to #new" do
      expect(:get => "/registered_apps/new").to route_to("registered_apps#new")
    end

    it "routes to #show" do
      expect(:get => "/registered_apps/1").to route_to("registered_apps#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/registered_apps/1/edit").to route_to("registered_apps#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/registered_apps").to route_to("registered_apps#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/registered_apps/1").to route_to("registered_apps#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/registered_apps/1").to route_to("registered_apps#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/registered_apps/1").to route_to("registered_apps#destroy", :id => "1")
    end

  end
end
