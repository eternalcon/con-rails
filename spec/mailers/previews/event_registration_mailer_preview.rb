# Preview all emails at http://localhost:3000/rails/mailers/event_registration_mailer
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
end
