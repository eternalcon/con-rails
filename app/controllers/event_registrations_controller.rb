class EventRegistrationsController <  ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  respond_to :html, :xls

  # TODO: The first registered participant needs to be assigned to the user if it is not there already (or any other way of having the current_user.participant be set properly.
  # TODO: Not quite related to this controller, but it would be cool to add an option for users to claim "their" participant - i.e. if somebody else registered my name last year and now I want to do it myself,
  
  def index
    @event = Event.find(params[:event_id])
    @event_registrations = @event.event_registrations.where(registration_token: nil) # only show proper event registrations, not prepared late registrations which haven't been filled in. 
    respond_with(@event_registrations) do |format|
      format.html
      format.xls # { send_data to_csv(@admin_event_registrations) }
    end
  end

  def new
    if Event.find_by(status: 'active') != nil
      @event_registration = EventRegistration.new do |r|
        r.event_id = Event.find_by(status: 'active').id
        r.user_id = current_user.id
        if current_user.participants.nil? # if the current user has never registered before, build empty participant hash.
          r.participants.build
        else
          r.participants = current_user.participants # if the current user has previously been registered, prefill the participant array with all participants linked to that user via any event_registrations.
        end  
      end
    else
      redirect_to root_path
    end    
  end
  
  def show
    respond_with(@event_registration)
  end

  def edit
    if @event_registration.participants.empty?
      @event_registration.participants.build
    end
  end

  def create
    @event_registration = EventRegistration.new(event_registration_params)
    @event_registration.save
    if @event_registration.save
      EventRegistrationMailer.registration_confirm(@event_registration).deliver_later
      EventRegistrationMailer.team_confirm(@event_registration).deliver_later
      respond_with(@event_registration)
    else
      render 'new'
    end
    
  end
  
  def update
    @event_registration.update(event_registration_params)
    EventRegistrationMailer.registration_confirm(@event_registration).deliver_later
    EventRegistrationMailer.team_late_confirm(@event_registration).deliver_later
    respond_with(@event_registration)
  end

  def destroy
    @event_registration.destroy
    respond_with(@event_registration)
  end

  def mark_as_payed
    unless @event_registration.payment_status == "payed"
      @event_registration.update  :payment_status => "payed"
      EventRegistrationMailer.payment_confirm(@event_registration).deliver_later 
    else
      flash[:alert] = "This event Registration is already marked as payed!"
    end
      respond_with(@event_registration, :location => event_event_registrations_path)
  end
  
  def resend_confirmation
    EventRegistrationMailer.registration_confirm(@event_registration).deliver_later
    flash[:notice] = "Confirmation E-Mail has been sent out again."
      respond_with(@event_registration, :location => event_event_registrations_path)
  end
  
  def generate_late_registration
    # Method to add an event_registration that can be filled out by the participant even after the event is labelled full in the database
    # Needed since we don't want to sell all available places online automatically.
    # However, when room assignment is done, we want to be able to allow more people in on an individual basis.
    # The idea here is: We send an E-mail to the participant containing a link with a unique url parameter to identify a specific event_registration
    # prepared for that participant to fill in with details.
    # TODO: Right now, we only display a form for entering the e-mail here. Everything else is handeled in the send_registration_link method.
    # TODO: This would be ideal for AJAXifying so we don't display a full view but just a popup to enter the address and submit. 
  end
  
  def send_registration_link
    @event_registration = EventRegistration.new
    @event_registration.event_id = params[:event_id]
    @event_registration.registration_token = EventRegistration.generate_url_token('registration_token')
    @event_registration.save!
    if @event_registration.save
      EventRegistrationMailer.late_registration_link(params[:email], @event_registration).deliver_later
      flash[:notice] = "Link has been sent"
    else
      render 'generate_late_registration' and return 
    end
    redirect_to events_path
  end
  
  def late_registration
    @event_registration = EventRegistration.find_by(registration_token: params[:registration_token])
    @event_registration.update :user_id => current_user.id, :registration_token => NIL
      redirect_to edit_event_event_registration_path( @event_registration.event_id, @event_registration.id )
  end
  
  private

    def event_registration_params
      params.require(:event_registration).permit(:event_id, :user_id, :payment_status, :participants, participants_attributes: [:first_name, :last_name, :birthdate, :nickname, :email, :country, :postcode, :_destroy ])
    end
end
