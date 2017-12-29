class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.integer :max_participants
      t.decimal :full_price
      t.decimal :youth
      t.decimal :child
      t.string :status
      t.timestamps
    end
  end
end
