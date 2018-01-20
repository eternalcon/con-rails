require 'rails_helper'

RSpec.describe "freeforms/new", type: :view do
  before(:each) do
    assign(:freeform, Freeform.new())
  end

  it "renders new freeform form" do
    render

    assert_select "form[action=?][method=?]", freeforms_path, "post" do
    end
  end
end
