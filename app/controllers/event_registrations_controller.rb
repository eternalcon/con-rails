class EventRegistrationsController < InheritedResources::Base
  before_action :authenticate_user!
  
  def new
    @event_registration = EventRegistration.new do |r|
      r.event_id = Event.find_by(status: 'active').id
      r.user_id = current_user.id
      r.participants.build
    end
  end
  
  private

    def event_registration_params
      params.require(:event_registration).permit()
    end
end

