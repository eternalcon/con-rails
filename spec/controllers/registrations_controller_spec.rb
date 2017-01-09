require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do

  before do
    create(:event)
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, xhr: true
      expect(response).to have_http_status(:success)
    end

    it "should redirect if event not avalable" do
      event = Event.active_event
      event.status_value = Event::StatusValue::NOT_AVAILABLE
      event.save

      get :new
      expect(response).to have_http_status(:redirect)
    end
  end


  describe 'GET not_available' do
    it "should have success" do
      event = Event.active_event
      event.status_value = Event::StatusValue::NOT_AVAILABLE
      event.save

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do

    it "returns http success" do
      post :create, params: { participant: participant_params, registration: registration_params }, xhr: true

      expect(response).to have_http_status(:success)
    end

    it 'should change the count of Registration' do
      expect{
        post :create, params: { participant: participant_params, registration: registration_params }, xhr: true
      }.to change(Registration, :count).by 1
    end

    it 'should change the count of Participants' do
      expect{
        post :create, params: { participant: participant_params, registration: registration_params }, xhr: true
      }.to change(Registration, :count).by 1
    end

    it 'should not change the count of participant if a particpant exist' do
      participant = create(:participant)

      expect{
        post :create, params: { participant: participant.attributes, registration: registration_params }, xhr: true
      }.to change(Participant, :count).by 0
    end
  end


  def registration_params
    { room_type: Registration::RoomType::DEFAULT }
  end

  def participant_params
    build(:participant).attributes
  end
end
