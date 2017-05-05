class CreateFreeforms < ActiveRecord::Migration[5.0]
  def change
    create_table :freeforms do |t|
      t.integer :event_id
      t.string :title
      t.text :desc_short
      t.text :desc_long
      t.integer :status, default_value: StatusValue::Freeform::DEFAULT
      t.timestamps
    end
  end
end
