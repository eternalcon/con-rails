class Participant < ApplicationRecord
  has_and_belongs_to_many :event_registrations
  validates :first_name, :last_name, :country, :birthdate, presence: true # We want to know at least the name and birthday of our participants, Contry should also be present, the other fields are optional.
   # make sure that each participant only exists once in the database - for our purpose, the combination of full name and birth date should be unique enough.
   # this is backed up by a database constraint to absolutely make sure no duplicates are saved.
  validates_uniqueness_of :first_name, :scopes [ :last_name, :birthdate ]
end
