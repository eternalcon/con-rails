class Admin::RegistrationOverviewController < Admin::AdminController
  before_action :authenticate_user!
  before_action :check_token

  def index
    @event = Event.find_by(status: 'full')
    @registrations = EventRegistration
      .includes([:participants, :user])
      .where(event_registrations: {event_id: @event} )
  end

  def participants
    render json: Participant.where("UPPER(last_name) like UPPER(?) AND birthdate < ?", "#{params[:name]}%", Date.today - 18.years)
  end

  private

  def check_token
    if params[:token].blank? || params[:token] != ENV['hidden_url_key']
      #redirect_to root_path
    end
  end
end
