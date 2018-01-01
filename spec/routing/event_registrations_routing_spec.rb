require "rails_helper"

RSpec.describe EventRegistrationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/event_registrations").to route_to("event_registrations#index")
    end

    it "routes to #new" do
      expect(:get => "/event_registrations/new").to route_to("event_registrations#new")
    end

    it "routes to #show" do
      expect(:get => "/event_registrations/1").to route_to("event_registrations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/event_registrations/1/edit").to route_to("event_registrations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/event_registrations").to route_to("event_registrations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/event_registrations/1").to route_to("event_registrations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/event_registrations/1").to route_to("event_registrations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/event_registrations/1").to route_to("event_registrations#destroy", :id => "1")
    end

  end
end
