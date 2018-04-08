class AddForeignKeysToEventRegistrationsParticipantsJoinTable < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :event_registrations_participants, :event_registrations
    add_foreign_key :event_registrations_participants, :participants
  end
end
