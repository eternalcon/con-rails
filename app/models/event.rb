class Event < ApplicationRecord
  has_many :event_registrations
  has_many :participants, through: :event_registrations
  has_many :freeforms
  validates :name, :start_date, :end_date, presence: true
  validate :end_date_must_be_after_start_date
  after_find do |event|
    set_status  
  end
   
    def set_status
      return unless errors.blank? # if we already hit an error when checking for the presence of all required attributes, we don't need to check the correct order of dates...
      if (Time.now.utc.to_date < registration_start_date) # The event happens in a future year - active event but registration disabled
        self.status =  'pending'
      #elsif (Time.now.utc.to_date.year == start_date.year) && (Time.now.utc.to_date < start_date) # The event happens this year, but hasn't happened yet - Registration open
      elsif (Time.now.utc.to_date >= registration_start_date) && (Time.now.utc.to_date < start_date) # Registration open between registration start date and start date.
        if self.participants.size > self.max_participants
          self.status = 'full'
        else
          self.status = 'active'
        end
      #elsif Time.now.utc.to_date >= :start_date # We're in the same year as the event, but the event is too close to allow online registrations 
      #  # TODO: figure out how close to the event is too close - one or two weeks in advance sounds reasonable. Will most likely not bee needed anyways since we book out too fast.
      #  self.status = 'waiting'
      elsif Time.now.utc.to_date > end_date # The event is in the past
        self.status = 'past'
      elsif Time.now.utc.to_date > start_date && Time.now.utc.to_date < end_date # Today is between start and end date - the event is currently on.
        self.status = 'running'
      end
      self.save
      
    end
    
    def end_date_must_be_after_start_date
      return unless errors.blank? # if we already hit an error when checking for the presence of all required attributes, we don't need to check the correct order of dates...
      if end_date.present? && end_date <= start_date
        errors.add(:end_date, "can't be the same or earlier than start date")
      end
    end
end
