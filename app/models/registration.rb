class Registration < ApplicationRecord
  belongs_to :event
  belongs_to :user
  belongs_to :participant
end
