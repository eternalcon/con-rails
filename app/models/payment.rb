class Payment < ApplicationRecord
  belongs_to :event_registration

  attr_accessor :participant_id
end
