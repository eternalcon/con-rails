class EventRegistrationsController <  ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  respond_to :html, :xls

  # TODO: We need to handle existing participants in the whole thing for future events.
  # TODO: The first registered participant needs to be assigned to the user if it is not there already (or any other way of having the current_user.participant be set properly.
  # TODO: We need to at least "recycle" existing participants when a record matching the entered data already exists in the database - i.e. only create the link between event_registration and participant
  # TODO: Better would be updating the existing participant if changed info is entered on the non-unique fields.
  # TODO: Maybe make the form autocomplete with AJAX when typing or something like that.
  # TODO: Not quite related to this controller, but it would be cool to add an option for users to claim "their" participant - i.e. if somebody else registered my name last year and now I want to do it myself,
  # TODO: have the existing participant linked to my user.
  
  def index
    @event = Event.find(params[:event_id])
    @event_registrations = @event.event_registrations
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
        if current_user.participant.nil?
          r.participants.build
        else
          r.participants.build(current_user.participant.serializable_hash)
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
  
  end

  def create
    @event_registration = EventRegistration.new(event_registration_params)
    @event_registration.save
    if @event_registration.save
      EventRegistrationMailer.registration_confirm(@event_registration).deliver_later
      EventRegistrationMailer.team_confirm(@event_registration).deliver_later
    else
      render 'new'
    end
    respond_with(@event_registration)
  end
  
  # No use yet - not implemented  
  #def update
  #  @event_registration.update(event_registration_params)
  #  respond_with(@event_registration)
  #end

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
  
  private

    def event_registration_params
      params.require(:event_registration).permit(:event_id, :user_id, :payment_status, :participants, participants_attributes: [:first_name, :last_name, :birthdate, :nickname, :email, :country, :postcode, :_destroy ])
    end
end
