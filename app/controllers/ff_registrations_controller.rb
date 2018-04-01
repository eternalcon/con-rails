class FfRegistrationsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  respond_to :html
  
  def new
    @ff_registration = FfRegistration.new do |r|
      r.freeform = Freeform.find_by(params[:freeform_id])
      r.user_id = current_user.id
      #r.participants.build
      current_user.event_registrations.each do |e|
        r.participants += e.participants
      end
    end
  end
    
  def create
    params[:ff_registration][:participant_ids] ||= []
    @ff_registration = FfRegistration.new(ff_registration_params)
    #@ff_registration.participants = params[:participant_ids] 
    #@ff_registration.participants = 
    @ff_registration.save
    #if @ff_registration.save
    #  EventRegistrationMailer.registration_confirm(@event_registration).deliver_later
    #  EventRegistrationMailer.team_confirm(@event_registration).deliver_later
    #else
    #  render 'new'
    #end
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
