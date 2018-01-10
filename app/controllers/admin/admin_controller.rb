class Admin::AdminController < ApplicationController
  before_action :verify_admin_user

  protected

  def verify_admin_user
    true
  end
end