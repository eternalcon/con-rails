class AddRoomTypeToRegistration < ActiveRecord::Migration[5.0]
  def change
    add_column :registrations, :room_type, :integer, after: :extra_night
  end
end
