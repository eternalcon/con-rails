class Registration < ApplicationRecord
  belongs_to :event
  belongs_to :participant
  
  validates_presence_of :event
  validates_presence_of :participant
end
