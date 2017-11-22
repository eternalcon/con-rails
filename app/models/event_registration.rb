class EventRegistration < ApplicationRecord
  belongs_to :event
  belongs_to :user
  belongs_to :participant
  belongs_to :registered_from, class_name: 'Participant'
end
