class ChangeProgramItemStartTimeColumnToEnumField < ActiveRecord::Migration[5.2]
  def change
    change_column :program_items, :start_time, :string
  end
end
