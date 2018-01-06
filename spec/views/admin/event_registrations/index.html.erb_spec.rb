require 'rails_helper'

RSpec.describe "admin/event_registrations/index", type: :view do
  before(:each) do
    assign(:admin_event_registrations, [
      Admin::EventRegistration.create!(),
      Admin::EventRegistration.create!()
    ])
  end

  it "renders a list of admin/event_registrations" do
    render
  end
end
