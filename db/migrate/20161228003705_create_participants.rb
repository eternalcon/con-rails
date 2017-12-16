class CreateParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :participants do |t|
      t.references :registration, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :email
      t.string :street
      t.string :postcode
      t.string :city
      t.string :country
#      t.string :notes
      t.date :birthdate
      t.boolean :newsletter

      t.timestamps
    end
  end
end
