require 'rails_helper'

RSpec.describe "Admin::EventRegistrations", type: :request do
  describe "GET /admin_event_registrations" do
    it "works! (now write some real specs)" do
      get admin_event_registrations_path
      expect(response).to have_http_status(200)
    end
  end
end
