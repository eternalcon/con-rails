class RevertCreateActiveAdminComments < ActiveRecord::Migration[5.1]
  require_relative '20170820172347_create_active_admin_comments'
  def change
    revert CreateActiveAdminComments
  end
end
