require 'rails_helper'

RSpec.describe "Freeforms", type: :request do
  describe "GET /freeforms" do
    it "works! (now write some real specs)" do
      get freeforms_path
      expect(response).to have_http_status(200)
    end
  end
end
