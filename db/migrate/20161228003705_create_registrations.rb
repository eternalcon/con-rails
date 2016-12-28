class CreateRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :registrations do |t|
      t.references :event, foreign_key: true
      t.references :participant, foreign_key: true
      t.text :notes
      t.boolean :shuttle
      t.boolean :extra_night

      t.timestamps
    end
  end
end
