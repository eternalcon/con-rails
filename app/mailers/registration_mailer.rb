class RegistrationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.registration_mailer.Registration.subject
  #
  def welcome_email registration
    @registration = registration
    @participant = Participant.find(@registration.participant_id)
    @event = @registration.event

    template_suffix = @participant.country == 'Germany' ? 'de' : 'eng'

    mail(
      to: @participant.email,
      subject: "#{@event.name}: Reservation") do |format|
        format.html { render "registration_email_#{template_suffix}_html" }
        format.text { render "registration_email_#{template_suffix}_plain" }
    end
  end

  def team_email registration
    @registration = registration
    @participant = registration.participant
    @event = @registration.event

    mail(
      to: ['andreas_pittelkow@web.de', 'info@eternal-con.de', '1812raevsky@gmail.com'],
      #to: 'boris.raeschler@gmx.de',
      subject: "#{@event.name}: New Incoming Reservation") do |format|
        format.text { render 'team_email_plain' }
    end
  end

end
