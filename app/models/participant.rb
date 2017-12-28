class Participant < ApplicationRecord
  has_and_belongs_to_many :event_registrations
  validates :first_name, :last_name, :country, :birthdate, presence: true # We want to know at least the name and birthday of our participants, Contry should also be present, the other fields are optional.
   # make sure that each participant only exists once in the database - for our purpose, the combination of full name and birth date should be unique enough.
   # this is backed up by a database constraint to absolutely make sure no duplicates are saved.
   # OPTIMIZE: Validation fails if trying to enter the same participant twice in the same event_registration form resulting in hard mysql error due to unique constraint.
   # OPTIMIZE: Should usually be no problem, but if this can be improved, we should do so.
  validates :first_name, uniqueness: { scope: [ :last_name, :birthdate ], message: "Participant already exists." }
  # Specifying the belongs_to relationship breaks functionality as appare
  # belongs_to :user, :inverse_of => :participant
end
