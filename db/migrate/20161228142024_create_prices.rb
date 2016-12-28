class CreatePrices < ActiveRecord::Migration[5.0]
  def change
    create_table :prices do |t|
      t.decimal :value, null: false
      t.date :valid_from, null: false
      t.date :valid_until, null: false
      t.timestamps
    end
  end
end
