class Freeform < ApplicationRecord
  belongs_to :event
  has_many :ff_registrations
  
  def set_status
      return unless errors.blank? # if we already hit an error when checking for the presence of all required attributes, we don't need to check anything else...
      return if self.status == "inactive" # If we set the status to inactive manually, we don't want it to be changed automatically...
      if self.participants.size > self.max_participants
        self.status = 'full'
      else
        self.status = 'active'
      end
      self.save
    end
    
end
