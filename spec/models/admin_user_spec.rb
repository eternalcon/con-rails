require 'rails_helper'
# Since we use devise for admin user authentication and authorization,
# we don't need to test the model properly since devise should already be 
# fully tested. We simply test wether our factory for generating test data
# is set up properly.
RSpec.describe AdminUser, type: :model do
  it "has a valid factory" do
    build(:admin_user).should be_valid
  end
end
