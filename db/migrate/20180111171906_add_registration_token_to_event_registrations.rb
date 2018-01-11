class AddRegistrationTokenToEventRegistrations < ActiveRecord::Migration[5.1]
  def change
    add_column :event_registrations, :registration_token, :string
    add_index :event_registrations, :registration_token, unique: true
  end
end
