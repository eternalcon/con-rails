require 'rails_helper'

RSpec.describe "event_registrations/show", type: :view do
  before(:each) do
    @event_registration = assign(:event_registration, EventRegistration.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
