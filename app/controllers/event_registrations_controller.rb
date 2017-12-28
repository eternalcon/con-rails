class EventRegistrationsController <  ApplicationController
  before_action :authenticate_user!
  
  def new
    @event_registration = EventRegistration.new do |r|
      r.event_id = Event.find_by(status: 'active').id
      r.user_id = current_user.id
      r.participants.build(current_user.participant.serializable_hash)
    end
  end
  
  def create
    @event_registration = EventRegistration.new(event_registration_params)
    @event_registration.save
    #@event_registration.participants.create
    if @event_registration.save
    redirect_to root_path # need proper redirect after save
    else
      render 'new'
    end
  end
  
  #def create
  #  @event_registration_ = EventRegistration.new(event_registration_params.from_json(include_root: true))
    #@event_registration.participants.each do |participant|
    #  puts participant.name
    #end
    # @event_registration.save
  
  #end
  
  private

    def event_registration_params
      params.require(:event_registration).permit(:event_id, :user_id, :participants, participants_attributes: [:first_name, :last_name, :birthdate, :nickname, :email, :country, :postcode, :_destroy ])
    end
end
