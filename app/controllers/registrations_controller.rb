class RegistrationsController < ApplicationController

  def index
    redirect_to(:controller => "participants", :action => "new")
  end

  def new
    active_event = Event.active_event
    redirect_to "/" if active_event.blank?
    redirect_to registration_not_available_path if active_event.status_value == Event::StatusValue::NOT_AVAILABLE

    @participants = [
        Participant.new(first_name: 'Boris', last_name: 'Raeschler', email: 'boris.raeschler@gmail.com'),
        ]
    @registration = Registration.new(room_type: Registration::RoomType::DEFAULT)
    @registration.event = active_event
    # @registration.participant = @participant

    #@lang = params[:lang].gsub("'","") unless params[:lang].blank?
    @lang =  "en" if @lang.blank?
    I18n.locale = @lang

  end

  def create
    @participants = fill_participants_array
  end

  def fill_participants_array
    val_ar = []

    (0..length_of_params).each do |i|
      val_ar << Participant.new(first_name: params[:part_first_name][i], last_name: params[:part_last_name][i], email: params[:part_email][i], age: params[:part_age][i])
    end
    val_ar
  end

  def length_of_params
    length = params[:part_first_name].length
    length = params[:part_last_name].length if params[:part_last_name].length > length
    length = params[:part_email].length if params[:part_email].length > length

    length
  end

  def create_old
    @lang = params[:lang] || "en"
    I18n.locale = @lang

    @is_create = false
    @participant = Participant.new participant_params

    @registration = Registration.new registration_params
    @registration.event = Event.active_event

    old_participant = Participant.where(email: @participant.email).first

    if !old_participant.blank?
      @participant = old_participant
    end

    @registration.participant = @participant

    if @participant.valid? && @registration.valid?
      if verify_recaptcha(:model => @registration)
        if @registration.save
          @is_create = true
          RegistrationMailer.welcome_email(@registration).deliver_later
          RegistrationMailer.team_email(@registration).deliver_later
        else
          flash[:error] = t(:fe_registration_error)
        end
      else
        @recaptcha_error = true
        is_create = false
        flash[:error] = t(:fe_captcha_controller)
      end
    else
      flash[:error] = t(:fe_registration_error)
    end

    logger.debug @registration.errors.inspect
    logger.debug @participant.errors.inspect
  end

  private

  def registration_params
    params.fetch(:registration, {}).permit(:event_id, :participant_id, :notes, :room_type)
  end

  def participant_params
    params.fetch(:participant, {}).permit(:first_name, :last_name, :email, :nickname, :country)
  end
end
