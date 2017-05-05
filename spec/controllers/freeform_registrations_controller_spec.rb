require 'rails_helper'

RSpec.describe FreeformRegistrationsController, type: :controller do
  render_views

  before do
    @event = create(:event)
    @freeform = create(:freeform, event: @event)
  end

  describe "GET NEW" do
    it "returns http success" do
      get :new, params: { freeform_id: @freeform }
      expect(response).to have_http_status(:success)
    end

    it "returns http success" do
      get :new, params: { freeform_id: @freeform }
      expect(response).to render_template(:new)
    end

  end

  describe "POST CREATE" do
    it 'should add a new registration' do

      expect{
        post :create, xhr: true, params: { freeform_id: @freeform, registration: {name: 'Boris Raeschler', email: 'boris.raeschler@gmx.de'} }
        to change(FreeformRegistration, :count).by(1)
      }
    end

    it "returns http success" do
      post :create, xhr: true, params: { freeform_id: @freeform, registration: {name: 'Boris Raeschler', email: 'boris.raeschler@gmx.de'} }
      expect(response).to have_http_status(:success)
    end

    it "returns http success" do
      post :create, xhr: true, params: { freeform_id: @freeform, registration: {name: 'Boris Raeschler', email: 'boris.raeschler@gmx.de'} }
      expect(response).to render_template(:create)
    end

    it 'should render create if some params are missing' do
      post :create, xhr: true, params: { freeform_id: @freeform, registration: {} }
      expect(response).to render_template("freeform_registrations/create")
    end
  end
end
