class Registration < ApplicationRecord
  module RoomType
    I_DONT_CARE = 10
    FAMILY_ROOM = 20
    PARTY_ROOM = 30
    PAY_SMALLER_ROOM = 40

    DEFAULT = I_DONT_CARE
  end

  belongs_to :event
  belongs_to :participant

  validates_presence_of :event
  validates_presence_of :participant
  validates :participant_id, uniqueness: { scope: :event_id }

end
