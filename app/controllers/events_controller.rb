class EventsController < ApplicationController
    before_action :authenticate_user!, :except => [ :home ]
#    before_action :set_admin_event, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource
    respond_to :html

  def home
    # The Events Controller index action is supposed to be the application root.
    # The root page of the app should always display the basict information
    # such as links to contact, imprint, faq and other generic information.
    # Additionally, if there is an active event, the main content of the page
    # should be information about the upcoming event.
    #@events = Event.all   
    #@event = Event.find_by( status: 'active' )# breaks when there is no active Event (Pending, Full etc. Need something more generic while still maintaining functionality
    @event = Event.first # Works for this year, needs to be changed for multiple events in database, so only the "active" event will be found instead of the first one.
    # TODO: Sort out what to display when there is no event currently active - i.e. after this years event and before registration for next years event starts...
  end
  
  def index
    respond_with @events
  end 
  
  def new
    respond_with @event
  end
  
  def show
    respond_with @event
  end
  
  def edit
    respond_with @event
  end
  
    def create
    @event.save
    respond_with @event
  end

  def update
    #@admin_event.update(admin_event_params)
    respond_with @event
  end

  def destroy
    # TODO: Currently raises Mysql-Error due to foreign key constraints with event_registrations.
    # TODO: Need to make tables cascade so if we decide to delete an event, we need to delete all event_registrations for that event as well.
    respond_with @event
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
