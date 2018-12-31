class FreeformsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  respond_to :html

  def index
    @event = Event.first #for now since finding by event_id breaks navbar at the moment... find(params[ :event_id ])
    @freeforms = @event.freeforms
    respond_with(@freeforms)
  end

  def show
    respond_with(@freeform)
  end

  def new
    @freeform = Freeform.new
    @freeform.event_id = params[:event_id]
  end

  def edit
  end

  def create
    @freeform = Freeform.new(freeform_params)
    @freeform.save
    respond_with(@freeform)
  end

  def update
    @freeform.update(freeform_params)
    respond_with(@freeform)
  end

  def destroy
    @freeform.destroy
    respond_with(@freeform)
  end

  private
    
    def freeform_params
      params.require(:freeform).permit(:event_id, :name, :description_de, :description_en, :language, :min_age, :max_age, :min_participants, :max_participants, :author_email, :status, :registration_start_date)
    end
end
