class EventRegistrationsController <  ApplicationController
  before_action :authenticate_user!
  before_action :check_for_event_full, only: [:new, :create]
  # TODO: We need to handle existing participants in the whole thing for future events.
  # TODO: The first registered participant needs to be assigned to the user if it is not there already (or any other way of having the current_user.participant be set properly.
  # TODO: We need to at least "recycle" existing participants when a record matching the entered data already exists in the database - i.e. only create the link between event_registration and participant
  # TODO: Better would be updating the existing participant if changed info is entered on the non-unique fields.
  # TODO: Maybe make the form autocomplete with AJAX when typing or something like that.
  # TODO: Not quite related to this controller, but it would be cool to add an option for users to claim "their" participant - i.e. if somebody else registered my name last year and now I want to do it myself,
  # TODO: have the existing participant linked to my user.
  
  def new
    @event_registration = EventRegistration.new do |r|
      r.event_id = Event.find_by(status: 'active').id
      r.user_id = current_user.id
      if current_user.participant.nil?
        r.participants.build
      else
        r.participants.build(current_user.participant.serializable_hash)
      end
    end
  end
  
  def create
    @event_registration = EventRegistration.new(event_registration_params)
    @event_registration.save
    #@event_registration.participants.create
    if @event_registration.save
      redirect_to event_registration_path(@event_registration)
      EventRegistrationMailer.registration_confirm(@event_registration).deliver_later
      EventRegistrationMailer.team_confirm(@event_registration).deliver_later
    else
      render 'new'
    end
  end
  
  def show
    @event_registration = EventRegistration.find(params[:id])
    unless @event_registration.user == current_user
      redirect_to root_path
    end
  end

  private

    def event_registration_params
      params.require(:event_registration).permit(:event_id, :user_id, :participants, participants_attributes: [:first_name, :last_name, :birthdate, :nickname, :email, :country, :postcode, :_destroy ])
    end

    def check_for_event_full
      redirect_to(root_path, notice: 'Sorry, Event is already booked out') if Event.find_by(status: 'active').blank?
    end
end
