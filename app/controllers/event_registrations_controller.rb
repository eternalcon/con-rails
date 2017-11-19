class EventRegistrationsController < InheritedResources::Base
  before_action :authenticate_user!
  
  private

    def event_registration_params
      params.require(:event_registration).permit()
    end
end

