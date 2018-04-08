class FfRegistrationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ff_registration_mailer.registration.subject
  #
  def registration
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ff_registration_mailer.registration_confirm.subject
  #
  def registration_confirm
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
