class FfRegistrationsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  respond_to :html
  
  def new
    @freeform = Freeform.find (params[:freeform_id])
    unless @freeform.status == "active"
      redirect_to root_path
    end
    @ff_registration = FfRegistration.new
    @ff_registration.freeform_id = params[:freeform_id]
    @ff_registration.user = current_user
    current_user.event_registrations.each do |e|
      @ff_registration.participants << e.participants
    end
  end
    
  def create
    params[:ff_registration][:participant_ids] ||= []
    @ff_registration = FfRegistration.new(ff_registration_params)
    if @ff_registration.save
      FfRegistrationMailer.registration_confirm(@ff_registration).deliver_later
      FfRegistrationMailer.registration(@ff_registration).deliver_later
    else
      render 'new'
    end
    respond_with(@ff_registration)
  end
  
  def show
    respond_with(@ff_registration)
  end
    
  private

    def ff_registration_params
      params.require(:ff_registration).permit(:event_id, :user_id, :freeform_id, :notes, participant_ids: [])
    end
end
