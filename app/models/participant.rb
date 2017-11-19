class Participant < ApplicationRecord
has_many :events, through: :event_registrations
end
