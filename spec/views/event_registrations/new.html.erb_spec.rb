require 'rails_helper'

RSpec.describe "event_registrations/new", type: :view do
  before(:each) do
    assign(:event_registration, EventRegistration.new())
  end

  it "renders new event_registration form" do
    render

    assert_select "form[action=?][method=?]", event_registrations_path, "post" do
    end
  end
end
