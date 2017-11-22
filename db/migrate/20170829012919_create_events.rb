class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.boolean :active, default: false
      t.integer :status_value, default: Event::StatusValue::DEFAULT
      t.timestamps
    end
  end
end
