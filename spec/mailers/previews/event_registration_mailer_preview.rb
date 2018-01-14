# Preview all emails at http://localhost:3000/rails/mailers/event_registration_mailer
Rails.application.routes.default_url_options[:host] = 'localhost:3000'
class EventRegistrationMailerPreview < ActionMailer::Preview
  def registration_confirm
    EventRegistrationMailer.registration_confirm(EventRegistration.first)  
  end
  
  def team_confirm
    EventRegistrationMailer.team_confirm(EventRegistration.first)  
  end
  
  def payment_confirm
    EventRegistrationMailer.payment_confirm(EventRegistration.first)  
  end
  
  def late_registration_link
    @event_registration = EventRegistration.first
    @event_registration.update registration_token: EventRegistration.generate_url_token('registration_token')
    EventRegistrationMailer.late_registration_link("test@test.test", @event_registration)  
  end
end
