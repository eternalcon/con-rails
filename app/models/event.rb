class Event < ApplicationRecord
  has_many :participants, through: :event_registrations
  validates :name, :start_date, :end_date, presence: true
  validate :end_date_must_be_after_start_date
    
  def end_date_must_be_after_start_date
    return unless errors.blank? # if we already hit an error when checking for the presence of all required attributes, we don't need to check the correct order of dates...
    if end_date.present? && end_date <= start_date
      errors.add(:end_date, "can't be the same or earlier than start date")
    end
  end
end
