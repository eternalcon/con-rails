class Participant < ApplicationRecord
has_many :events, through: :registrations
end
