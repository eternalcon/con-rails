class EventRegistration < ApplicationRecord
  belongs_to :event
  belongs_to :user
  has_and_belongs_to_many :participants
  accepts_nested_attributes_for :participants
end
