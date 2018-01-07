class UsersRolesJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :Users, :Roles do |t|
      t.index :user_id
      t.index :role_id
    end
  end
end
