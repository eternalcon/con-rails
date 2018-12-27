class AddRegistrationStartDateToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :registration_start_date, :date
  end
end
