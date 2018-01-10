require 'rails_helper'

RSpec.describe "admin/event_registrations/edit", type: :view do
  before(:each) do
    @admin_event_registration = assign(:admin_event_registration, Admin::EventRegistration.create!())
  end

  it "renders the edit admin_event_registration form" do
    render

    assert_select "form[action=?][method=?]", admin_event_registration_path(@admin_event_registration), "post" do
    end
  end
end
