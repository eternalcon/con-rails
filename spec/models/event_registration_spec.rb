require 'rails_helper'

RSpec.describe EventRegistration, type: :model do
  describe '#create' do
    it 'should save a valid event_registration' do
      expect(create(:event_registration)).to be_truthy
    end
  end

  describe '#participants' do
    it 'should know about his event' do
      event_registration = create(:event_registration)
      expect(event_registration.event.blank?).to be_falsey
    end
    it 'should know about his user' do
      event_registration = create(:event_registration)
      expect(event_registration.user.blank?).to be_falsey
    end
    it 'should know about his participants' do
      event_registration = create(:event_registration)
      expect(event_registration.participants.size).to eq(1)
    end
  end
end
