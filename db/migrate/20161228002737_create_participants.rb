class CreateParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :participants do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :street
      t.string :postcode
      t.string :city
      t.string :country
#      t.string :notes
      t.date :birthdate
      t.string :newsletter

      t.timestamps
    end
  end
end
