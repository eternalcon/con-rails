class CreateFreeformRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :freeform_registrations do |t|
      t.integer :freeform_id
      t.integer :participant_id
      t.string :name
      t.string :email
      t.text :notes
      t.timestamps
    end
  end
end
