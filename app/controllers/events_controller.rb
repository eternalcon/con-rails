class EventsController < ApplicationController

  def index
    # The Events Controller index action is supposed to be the application root.
    # The root page of the app should always display the basict information
    # such as links to contact, imprint, faq and other generic information.
    # Additionally, if there is an active event, the main content of the page
    # should be information about the upcoming event.
    
    @event = Event.first # needs to be changed for multiple events in database, so only the "active" event will be found instead of the first one.
  end
end
