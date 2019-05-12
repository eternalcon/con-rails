require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery prepend:true, with: :exception
  before_action :set_locale
  # Since we need information about the active event everywhere, we set it in the application controller now.
  
  before_action :find_active_event
 
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  
  def self.default_url_options
    { locale: I18n.locale }
  end
  
  def find_active_event
    if @event = Event.find_by( status: 'active' )# breaks when there is no active Event (Pending, Full etc. Need something more generic while still maintaining functionality
    # if there is more than one active event, the first event in the database will be used for now - not ideal, but there should never be more than one active...
     elsif @event = Event.find_by( status: 'pending' ) 
     else @event = Event.find_by( status: 'full' )
    end
  end
  
  
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end
end
