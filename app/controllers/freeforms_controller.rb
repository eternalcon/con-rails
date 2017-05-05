class FreeformsController < ApplicationController

  def index
    @event = Event.active_event
    redirect_to root_path if @event.blank?

    @freeforms = Freeform.where(event_id: @event)
  end
end
