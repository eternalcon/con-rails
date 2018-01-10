require "rails_helper"

RSpec.describe Admin::EventRegistrationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/event_registrations").to route_to("admin/event_registrations#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/event_registrations/new").to route_to("admin/event_registrations#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/event_registrations/1").to route_to("admin/event_registrations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/event_registrations/1/edit").to route_to("admin/event_registrations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/event_registrations").to route_to("admin/event_registrations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/event_registrations/1").to route_to("admin/event_registrations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/event_registrations/1").to route_to("admin/event_registrations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/event_registrations/1").to route_to("admin/event_registrations#destroy", :id => "1")
    end

  end
end
