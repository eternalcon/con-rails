require 'rails_helper'

RSpec.describe Participant, type: :model do
  describe '#create' do
    it 'should save a valid model' do
      expect(create(:participant)).to be_truthy
    end
  end
end
