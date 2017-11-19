require 'rails_helper'

RSpec.describe "event_registrations/index", type: :view do
  before(:each) do
    assign(:event_registrations, [
      EventRegistration.create!(),
      EventRegistration.create!()
    ])
  end

  it "renders a list of event_registrations" do
    render
  end
end
