class AddForeignKeysToRolesUsersJoinTable < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :roles_users, :roles
    add_foreign_key :roles_users, :users
  end
end
