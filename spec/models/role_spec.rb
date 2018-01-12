require 'rails_helper'

RSpec.describe Role, type: :model do
  describe '#create' do
    it 'should save a valid model' do
      expect(create(:admin_role)).to be_truthy
    end
  end
end
