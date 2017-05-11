class CreateBoardGames < ActiveRecord::Migration[5.0]
  def change
    create_table :board_games do |t|
      t.integer :event_id
      t.string :title
      t.text :description
      t.string :author_name
      t.timestamps
    end
  end
end
