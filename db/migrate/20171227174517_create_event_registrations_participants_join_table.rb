class CreateEventRegistrationsParticipantsJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :event_registrations, :participants do |t|
      #t.index [:event_registration_id, :participant_id]
      #t.index [:participant_id, :event_registration_id]
    end
  end
end
