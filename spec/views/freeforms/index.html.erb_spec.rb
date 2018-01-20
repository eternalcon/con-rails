require 'rails_helper'

RSpec.describe "freeforms/index", type: :view do
  before(:each) do
    assign(:freeforms, [
      Freeform.create!(),
      Freeform.create!()
    ])
  end

  it "renders a list of freeforms" do
    render
  end
end
