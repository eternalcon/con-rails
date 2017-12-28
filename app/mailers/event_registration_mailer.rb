class EventRegistrationMailer < ApplicationMailer
  default from: 'info@eternal-con.de'
  layout 'mailer'
  
  def registration_confirm(event_registration)
    @event_registration = event_registration
    mail(to: @event_registration.user.email, subject: 'Congratulations! You are part of ' + @event_registration.event.name)
  end
end
