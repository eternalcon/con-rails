module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @current_user = create :admin_user
      sign_in :user, @current_user
    end
  end
end