class RegistrationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.registration_mailer.Registration.subject
  #
  def Welcome_Email(registration)
    @regitstration = registration
    #@participant = Participant.find(@registration.participant)
    #@event = @registration.event
    email_with_name  = %("The Eternal Convention" <info@eternal-con.de>)
    mail(from: email_with_name, to: "test@test.com", subject: "test")
  end
  
  
#  def Team_Email
#    recipients ["andreas_pittelkow@web.de", "Desiree Tillack <desiree.tillack@gmx.de>", "Christian Einsporn <christian.einsporn@t-online.de>"]
#    #recipients ["boris.raeschler@gmx.de"]
#    from "Eternal Convention <info@eternal-con.de>"
#    subject "Registrierung für Eternal Convenction 2015 eingetroffen "
#    sent_on Time.now 
#    content_type "multipart/alternative"#
#
#    part "text/plain" do |p|
#      p.body = render_message("team_email_plain", :registration => registration, :participant => registration.participant)
#    end
#  end
end
