class CreateFreeforms < ActiveRecord::Migration[5.1]
  def change
    create_table :freeforms do |t|
      t.string :name
      t.text :description_de
      t.text :description_en
      t.string :language
      t.integer :min_age
      t.integer :max_age
      t.integer :min_participants
      t.integer :max_participants
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
