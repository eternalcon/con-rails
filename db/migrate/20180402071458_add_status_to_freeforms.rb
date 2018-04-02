class AddStatusToFreeforms < ActiveRecord::Migration[5.1]
  def change
    add_column :freeforms, :status, :string
  end
end
