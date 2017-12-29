require 'rails_helper'

RSpec.describe "event_registrations/edit", type: :view do
  before(:each) do
    @event_registration = assign(:event_registration, EventRegistration.create!())
  end

  it "renders the edit event_registration form" do
    render

    assert_select "form[action=?][method=?]", event_registration_path(@event_registration), "post" do
    end
  end
end
