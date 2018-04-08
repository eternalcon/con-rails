class AddAuthorEmailToFreeforms < ActiveRecord::Migration[5.1]
  def change
    add_column :freeforms, :author_email, :string
  end
end
