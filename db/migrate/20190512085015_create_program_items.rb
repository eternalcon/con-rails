class CreateProgramItems < ActiveRecord::Migration[5.2]
  def change
    create_table :program_items do |t|
      t.string :title
      t.text :description_de
      t.text :description_en
      t.datetime :start_time
      t.decimal :duration
      t.string :language
      t.integer :min_age
      t.integer :min_player_count
      t.integer :max_player_count
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
