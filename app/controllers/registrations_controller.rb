class RegistrationsController < ApplicationController
  def index
    redirect_to(:controller => "participants", :action => "new")
  end

  def new
    active_event = Event.active_event
    redirect_to "/" if active_event.blank?

    @participant = Participant.find(params[:participant])
    @registration = Registration.new
    #@registration.errors.add :base, "Word verification response is incorrect, please try again." if !params[:error].blank? && params[:error] == "true"
    @registration.event = active_event
    @registration.participant = @participant
    #@registration.notes = t(:registration_notice_value)
    #@registration.freeform_skill_value = nil

    #@lang = params[:lang].gsub("'","") unless params[:lang].blank?
    @lang =  "en" if @lang.blank?
    I18n.locale = @lang

    #if active_event.status_value != Event::REGISTRATION_IS_AVAILABLE
    #  render :action => :registration_is_not_available
    #else
    #  render
    #end
  end


  def create
    @lang = params[:lang] || "en"
    I18n.locale = @lang

    is_create = false
  #  @participant = Participant.new(params[:participant])
    @registration = Registration.new(registration_params)

    if verify_recaptcha(:model => @registration)
    #we try to find if the person have already registered for a early event
#    participant = Participant.find(:first, :conditions => ['first_name=? AND last_name=?', @participant.first_name, @participant.last_name])

#    if participant
#      @registration.participant = participant
#    else
#      @registration.participant = @participant
#    end
      #respond_to do |format|
        if @registration.save
          is_create = true
          flash[:notice] = t(:fn_registration_success)
          # Tell the RegistrationMailer to send welcome email after save
          RegistrationMailer.Welcome_Email(@registration).deliver_now #.deliver_later
          #RegistrationMailer.Team_Email(@registration).deliver_now #.deliver_later
          unless is_create
            render :action => "new"
          end
#          format.js{
#            render :update do |page|
#          #page.replace_html "flash_messages", :partial => "/shared/flash_messages"
#              unless is_create
#                page.replace_html "registerFormDiv", :partial => "form" 
#                page.replace_html "recaptcha_div", :partial => "recaptcha"
#              end
#         
#          #page.redirect_to new_registration_path(:error => true) unless is_create
#              page.replace_html "registerFormDiv", :partial => "after_registration" if is_create
#          end
#          }
        else
          flash[:error] = t(:fe_registration_error) 
        end
      render
      #end
    else
      @recaptcha_error = true 
      @registration.valid? 
      render :action => "new"
      is_create = false
      flash[:error] = t(:fe_captcha_controller)
    end
  end   
  
  private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
    def registration_params
      params.fetch(:registration, {}).permit(:event_id, :participant_id, :notes, :shuttle, :extra_night)
    end
end
