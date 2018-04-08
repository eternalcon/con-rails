# Preview all emails at http://localhost:3000/rails/mailers/ff_registration
class FfRegistrationPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/ff_registration/registration
  def registration
    FfRegistrationMailer.registration
  end

  # Preview this email at http://localhost:3000/rails/mailers/ff_registration/registration_confirm
  def registration_confirm
    FfRegistrationMailer.registration_confirm
  end

end
