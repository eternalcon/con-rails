class FfRegistrationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ff_registration_mailer.registration.subject
  #
  def registration(ff_registration)
    @ff_registration = ff_registration

    mail(to: @ff_registration.freeform.author_email, subject: '[Eternal Con ] - new Player Registration for' + @ff_registration.freeform.name)
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ff_registration_mailer.registration_confirm.subject
  #
  def registration_confirm(ff_registration)
    @ff_registration = ff_registration

    mail(to: @ff_registration.user.email, subject: default_i18n_subject(freeform_name: @ff_registration.freeform.name))
  end
end
