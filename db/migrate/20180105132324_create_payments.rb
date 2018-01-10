class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.references :event_registrations, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :payment_type
      t.decimal :payment_value, precision: 8, scale: 2
      t.date :payment_date
      t.timestamps
    end
  end
end
