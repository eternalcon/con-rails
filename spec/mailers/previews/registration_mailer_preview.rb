# Preview all emails at http://localhost:3000/rails/mailers/registration_mailer
class RegistrationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/registration_mailer/Registration
  def Registration
    RegistrationMailerMailer.Registration
  end

  # Preview this email at http://localhost:3000/rails/mailers/registration_mailer/Registration_Team
  def Registration_Team
    RegistrationMailerMailer.Registration_Team
  end

end
