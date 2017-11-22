require_relative '../rails_helper'

RSpec.describe Participant, type: :model do

end

RSpec.describe '#create' do
  it "should save a valid model" do
    participant = build(:participant)

    expect(participant.save).to be_truthy
  end
end
