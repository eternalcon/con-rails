class EventsController < ApplicationController

  def index
    # The Events Controller index action is supposed to be the application root.
    # The root page of the app should always display the basict information
    # such as links to contact, imprint, faq and other generic information.
    # Additionally, if there is an active event, the main content of the page
    # should be information about the upcoming event.
    #@events = Event.all   
    @event = Event.find_by( status: 'active')
    #@event = Event.first # needs to be changed for multiple events in database, so only the "active" event will be found instead of the first one.
    # TODO: Sort out what to display when there is no event currently active - i.e. after this years event and before registration for next years event starts...
  end    
  
  private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
    def event_params
      params.require(:event).permit(:name, :start_date, :end_date, :full_price, :day_guest, :child, :participant_id, :event_registration_id, :status)
    end
end
