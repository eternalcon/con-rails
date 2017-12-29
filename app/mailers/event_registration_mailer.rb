class EventRegistrationMailer < ApplicationMailer
  default from: 'info@eternal-con.de'
  layout 'mailer'
  
  def registration_confirm(event_registration)
    @event_registration = event_registration
    mail(to: @event_registration.user.email, subject: '[The Eternal Convention] - Congratulations! You are part of ' + @event_registration.event.name)
  end
  
  def team_confirm(event_registration)
    @event_registration = event_registration
    mail(to: ['andreas_pittelkow@web.de', 'info@eternal-con.de', '1812raevsky@gmail.com'], subject: '[Eternal Con Registration ] - neue Anmeldung für' + @event_registration.event.name)
  end
end
