class AddPricesToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :full_price, :decimal
    add_column :events, :day_guest, :decimal
    add_column :events, :child, :decimal
  end
end
