class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name, :null => false
      t.string :subtitle
      t.string :startdate, :null => false
      t.string :enddate, :null => false
      t.boolean :active, :default => false
      t.integer :status_value, :default => 10

      t.timestamps
    end
  end
end
