class AddRegistrationStartDateToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :registration_start_date, :date, default: Time.now.utc.to_date - 2.months
  end
end
