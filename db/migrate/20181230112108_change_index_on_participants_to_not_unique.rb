class ChangeIndexOnParticipantsToNotUnique < ActiveRecord::Migration[5.2]
  def change
    remove_index :participants, [ :first_name, :last_name, :birthdate]
    add_index :participants, [ :first_name, :last_name, :birthdate]
  end
end
