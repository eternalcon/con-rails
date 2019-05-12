class AddUserToProgramItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :program_items, :user, foreign_key: true
  end
end
