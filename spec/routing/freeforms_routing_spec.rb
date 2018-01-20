require "rails_helper"

RSpec.describe FreeformsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/freeforms").to route_to("freeforms#index")
    end

    it "routes to #new" do
      expect(:get => "/freeforms/new").to route_to("freeforms#new")
    end

    it "routes to #show" do
      expect(:get => "/freeforms/1").to route_to("freeforms#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/freeforms/1/edit").to route_to("freeforms#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/freeforms").to route_to("freeforms#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/freeforms/1").to route_to("freeforms#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/freeforms/1").to route_to("freeforms#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/freeforms/1").to route_to("freeforms#destroy", :id => "1")
    end

  end
end
