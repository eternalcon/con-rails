require 'rails_helper'

RSpec.describe Event, type: :model do
  it "has a valid factory" do
    expect(build(:event)).to be_valid
  end
  it "is invalid without a name" do 
    expect(build(:event, name: nil)).to be_invalid
  end
  it "is invalid without a start date" do 
    expect(build(:event, start_date: nil, end_date: Faker::Time.forward(360, :morning))).to be_invalid
  end
  it "is invalid without a end date" do 
    expect(build(:event, end_date: nil)).to be_invalid
  end
  it "is invalid if end date is the same as start date or before start date" do
    expect(build(:event, start_date: Time.now, end_date: Time.now)).to be_invalid
    expect(build(:event, start_date: Time.now, end_date: Time.now - 3.days )).to be_invalid
    #expect(build(:event, end_date: @event.start_date - 3.days)).to be_invalid
  end
  
end
