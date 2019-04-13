class AddRegistrationStartDateToFreeforms < ActiveRecord::Migration[5.2]
  def change
    add_column :freeforms, :registration_start_date, :date
  end
end
