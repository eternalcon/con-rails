class EventRegistration < ApplicationRecord
  belongs_to :event
  belongs_to :user
  has_and_belongs_to_many :participants
  accepts_nested_attributes_for :participants, reject_if: :all_blank, allow_destroy: true # accept participants upon creating a new event_registration
  validates_associated :participants # make sure the accepted participants all are valid participants before committing to database
end
