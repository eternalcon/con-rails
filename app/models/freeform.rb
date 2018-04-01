class Freeform < ApplicationRecord
  belongs_to :event
  has_many :ff_registrations
end
