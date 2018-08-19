require 'rails_helper'

RSpec.describe Participant, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:participant)).to be_valid
  end
  it "is invalid without a first name" do
    expect(FactoryBot.build(:participant, first_name: nil)).to be_invalid
  end
  it "is invalid without a last name" do 
    expect(FactoryBot.build(:participant, last_name: nil)).to be_invalid
  end
  it "is invalid without a country" do 
    expect(FactoryBot.build(:participant, country: nil)).to be_invalid
  end
  it "is invalid without a birth date" do 
    expect(FactoryBot.build(:participant, birthdate: nil)).to be_invalid
  end
  let(:participant_attr) { FactoryBot.attributes_for(:participant) }
  it "can not be created if a participant with the same name and birthdate already exists" do
    participant1 = Participant.create!(participant_attr)
    expect(participant2 = Participant.create(participant_attr)).to be_invalid
  end
    
end
