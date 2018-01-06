require 'rails_helper'

RSpec.describe "admin/event_registrations/new", type: :view do
  before(:each) do
    assign(:admin_event_registration, Admin::EventRegistration.new())
  end

  it "renders new admin_event_registration form" do
    render

    assert_select "form[action=?][method=?]", admin_event_registrations_path, "post" do
    end
  end
end
