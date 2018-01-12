require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    it 'should save a valid model' do
      expect(create(:user)).to be_truthy
    end

    it 'should assign admin role to admin_user' do
      user = create(:admin_user)
      expect(user.roles.map(&:name).include?('Admin')).to be_truthy
    end
  end
end
