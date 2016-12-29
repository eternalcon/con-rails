class RegistrationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.registration_mailer.Registration.subject
  #
  def welcome_email registration
    @registration = registration
    @participant = Participant.find(@registration.participant_id)

    template_suffix = @participant.country == 'Germany' ? 'de' : 'eng'

    @event = @registration.event
    mail(
      to: @participant.email,
      subject: 'Eternal Con 2017: Reservation') do |format|
        format.html { render "registration_email_#{template_suffix}_html" }
        format.text { render "registration_email_#{template_suffix}_plain" }
      end
  end

  def team_email registration
    @registration = registration
    @participant = registration.participant

    mail(
      to: ['andreas_pittelkow@web.de', 'info@eternal-con.de', '1812raevsky@gmail.com'],
      subject: 'Eternal Con 2017: New Reservation'
    )
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
