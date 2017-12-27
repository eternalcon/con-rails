class Participant < ApplicationRecord
  has_and_belongs_to_many :event_registrations
  validates :first_name, :last_name, :country, :birthdate, presence: true
end
