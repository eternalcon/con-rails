require 'rails_helper'

RSpec.describe "admin/event_registrations/show", type: :view do
  before(:each) do
    @admin_event_registration = assign(:admin_event_registration, Admin::EventRegistration.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
