class FfRegistrationParticipantsJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :ff_registrations, :participants do |t|
      t.references :ff_registration, foreign_key: true
      t.references :participant, foreign_key: true
    end
  end
end
