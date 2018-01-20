require 'rails_helper'

RSpec.describe "freeforms/edit", type: :view do
  before(:each) do
    @freeform = assign(:freeform, Freeform.create!())
  end

  it "renders the edit freeform form" do
    render

    assert_select "form[action=?][method=?]", freeform_path(@freeform), "post" do
    end
  end
end
