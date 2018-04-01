class CreateFfRegistrations < ActiveRecord::Migration[5.1]
  def change
    create_table :ff_registrations do |t|
      t.references :freeform, foreign_key: true
      t.references :user, foreign_key: true
      t.text :notes

      t.timestamps
    end
  end
end
