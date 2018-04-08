# Preview all emails at http://localhost:3000/rails/mailers/ff_registration
class FfRegistrationPreview < ActionMailer::Preview
  def default_url_options
    Rails.application.config.action_mailer.default_url_options
  end
  # Preview this email at http://localhost:3000/rails/mailers/ff_registration/registration
  def registration
    FfRegistrationMailer.registration(FfRegistration.first)
  end

  # Preview this email at http://localhost:3000/rails/mailers/ff_registration/registration_confirm
  def registration_confirm
    FfRegistrationMailer.registration_confirm(FfRegistration.first)
  end

end
