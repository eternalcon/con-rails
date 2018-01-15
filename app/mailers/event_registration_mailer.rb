class EventRegistrationMailer < ApplicationMailer
  default from: 'info@eternal-con.de'
  layout 'mailer'
  
  def registration_confirm(event_registration)
    @event_registration = event_registration
    mail(to: @event_registration.user.email, subject: default_i18n_subject(event: @event_registration.event.name))
  end
  
  def team_confirm(event_registration)
    @event_registration = event_registration
    mail(to: ['andreas_pittelkow@web.de', 'info@eternal-con.de', '1812raevsky@gmail.com'], subject: '[Eternal Con Registration ] - neue Anmeldung für' + @event_registration.event.name)
  end
  
  def payment_confirm(event_registration)
    @event_registration = event_registration
    mail(to: @event_registration.user.email, subject: default_i18n_subject(event: @event_registration.event.name) + "Payment Confirmed!")
  end
  
  def late_registration_link(email, event_registration)
    @event_registration = event_registration
    @email = email
    mail(to: @email, subject: default_i18n_subject(event: @event_registration.event.name))
  end
  
  def team_late_confirm(event_registration)
    @event_registration = event_registration
    mail(to: ['andreas_pittelkow@web.de', 'info@eternal-con.de', '1812raevsky@gmail.com'], subject: '[Eternal Con Registration ] - Nachzügler-Anmeldung ausgefüllt für' + @event_registration.event.name)
  end
end
