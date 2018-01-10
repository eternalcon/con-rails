class Admin::EventsController < ApplicationController
  before_action :set_admin_event, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @admin_events = Event.all
    respond_with @admin_events
  end

  def show
    respond_with @admin_events
  end

  def new
    @admin_event = Event.new
    respond_with @admin_events
  end

  def edit
    respond_with @admin_event
  end

  def create
    @admin_event = Event.new(admin_event_params)
    @admin_event.save
    respond_with @admin_events
  end

  def update
    @admin_event.update(admin_event_params)
    respond_with @admin_events, :location => admin_events_path
  end

  def destroy
    # TODO: Currently raises Mysql-Error due to foreign key constraints with event_registrations.
    # TODO: Need to make tables cascade so if we decide to delete an event, we need to delete all event_registrations for that event as well.
    @admin_event.destroy
    respond_with @admin_events
  end

  private
    def set_admin_event
      @admin_event = Event.find(params[:id])
    end

    def admin_event_params
      params.require(:event).permit( :name, :start_date, :end_date, :max_participants, :full_price, :youth, :child, :status)
    end
end
