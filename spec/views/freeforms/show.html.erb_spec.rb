require 'rails_helper'

RSpec.describe "freeforms/show", type: :view do
  before(:each) do
    @freeform = assign(:freeform, Freeform.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
