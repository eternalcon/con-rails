class CreateFreeformAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :freeform_authors do |t|
      t.integer :freeform_id
      t.string :name
      t.string :email
      t.timestamps
    end
  end
end
