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
  end
  
  # Test for event status switch based on date
  it "is pending if it happens in a future year" do
    event = create(:event, start_date: Time.now + 2.years, end_date: Time.now + 2.years + 3.days)
    expect(event.status).to eq "pending"
  end
  
  it "is active if it happens this year and far enough in the future" do
    # FIXME: We have a testing problem here, especially in comparison with the next case. If we run tests towards the end of the year, i.e. before the registration is supposed to start,
    # the distance needed from Time.now to make the event happen in the future might already result in the event being assigned a start date past new years, making the event pending instead of active.
    # It may be impossible to generate an event which still falls in the "active" category towards the year's end.

    event = create(:event, start_date: Time.now + 2.days, end_date: Time.now + 5.days)
    expect(event.status).to eq "active"
  end
#  it "is in waiting stage if it happens this year but is too close to allow online registration" do
#    event = create(:event, start_date: Time.now + 2.years, end_date: Time.now + 2.years + 3.days)
#    expect(event.status).to eq "waiting"
#  end

  it "is past if the end_date is earlier than Time.now" do
    event = create(:event, start_date: Time.now - 5.days, end_date: Time.now - 3.days)
    expect(event.status).to eq "past"
  end

#  it "is full if the maximum number of spaces has been booked" do
#    #event = create(:event, start_date: Time.now - 5.days, end_date: Time.now - 3.days)
#    expect(event.status).to eq "full"
#  end

  it "is running if today is between start_date and end_date" do
    event = create(:event, start_date: Time.now - 1.day, end_date: Time.now + 2.days)
    expect(event.status).to eq "running"
  end

#    when Time.now.utc.to_date > :end_date # The event is in the past
#      :status = "past"
#    when # TODO: Add a case for active events which are booked out for online registration.
#      :status = "full"
#    when Time.now.utc.to_date > :start_date && Time.now.utc.to_date < :end_date # Today is between start and end date - the event is currently on.
#      :status = "running"
#   end
end
