class Admin::EventRegistrationsController < ApplicationController
  before_action :set_admin_event_registration, only: [:show, :edit, :update, :destroy]

  respond_to :html, :xls

  def index
    @event = Event.find(params[:event_id])
    @admin_event_registrations = @event.event_registrations
    respond_with(@admin_event_registrations) do |format|
      format.html
      format.xls # { send_data to_csv(@admin_event_registrations) }
    end
  end

  def show
    respond_with(@admin_event_registration)
  end

  def new
    @admin_event_registration = EventRegistration.new
    respond_with(@admin_event_registration)
  end

  def edit
  end

  def create
    @admin_event_registration = EventRegistration.new(admin_event_registration_params)
    @admin_event_registration.save
    respond_with(@admin_event_registration)
  end

  def update
    @admin_event_registration.update(admin_event_registration_params)
    respond_with(@admin_event_registration)
  end

  def destroy
    @admin_event_registration.destroy
    respond_with(@admin_event_registration)
  end

  private
    def set_admin_event_registration
      @admin_event_registration = EventRegistration.find(params[:id])
    end

    def admin_event_registration_params
      params[:event_registration]
    end
end
