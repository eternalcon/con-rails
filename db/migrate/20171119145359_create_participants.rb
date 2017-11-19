class CreateParticipants < ActiveRecord::Migration[5.1]
  def change
    create_table :participants do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :email
      t.string :country
      t.string :postcode
      t.date :birthdate

      t.timestamps
    end
  end
end
