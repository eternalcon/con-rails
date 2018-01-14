class AddPaymentStatusToEventRegistration < ActiveRecord::Migration[5.1]
  def change
    add_column :event_registrations, :payment_status, :string, default: "open"
  end
end
