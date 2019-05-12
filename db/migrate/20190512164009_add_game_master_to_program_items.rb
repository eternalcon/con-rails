class AddGameMasterToProgramItems < ActiveRecord::Migration[5.2]
  def change
    add_column :program_items, :gamemaster, :string
  end
end
