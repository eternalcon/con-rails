class EventRegistration < ApplicationRecord
  belongs_to :event
  belongs_to :user
  has_and_belongs_to_many :participants
  accepts_nested_attributes_for :participants, reject_if: :all_blank, allow_destroy: true # accept participants upon creating a new event_registration
  validates_associated :participants # make sure the accepted participants all are valid participants before committing to database
  
  
  
  # TODO For usability outside our very specific use case, this has to be changed to something more sophisticated.
  def participant_price?(participant)
    if participant.age(self.event.start_date) < 7 # Children under 7 are free
      price = 0
    elsif participant.age(self.event.start_date).between?(7, 14) # Children between 7 and 14 pay Child fee
      price = self.event.child
    else # Everybody else pays full
      self.event.full_price
    end
  end
  
end
