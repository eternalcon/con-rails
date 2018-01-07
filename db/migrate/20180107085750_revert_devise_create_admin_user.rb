class RevertDeviseCreateAdminUser < ActiveRecord::Migration[5.1]
    require_relative '20170820172257_devise_create_admin_users'
  def change
    revert DeviseCreateAdminUsers
  end
end
