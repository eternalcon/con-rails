class ProgramItemsController < ApplicationController
  before_action :set_program_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [ :index, :show ]
  load_and_authorize_resource
  # skip_authorize_resource only: [ :index, :show ]

  respond_to :html

  def index
    #@event = Event.find(params[ :event_id ])
    @program_items = @event.program_items
    respond_with(@program_items)
  end

  def show
    respond_with(@program_item)
  end

  def new
    #@event = Event.find (params[:event_id])
    @program_item = ProgramItem.new
    @program_item.event_id = params[:event_id]
  end

  def edit
  end

  def create
    @program_item = ProgramItem.new(program_item_params)
    if @program_item.save
      redirect_to event_program_items_path(@event)
    else
      render 'new'
    end
  end

  def update
    @program_item.update(program_item_params)
    respond_with(@program_item)
  end

  def destroy
    @program_item.destroy
    redirect_to event_program_items_path(@event)
  end

  private
    def set_program_item
      @program_item = ProgramItem.find(params[:id])
    end

    def program_item_params
      params.require(:program_item).permit(:title, :description_de, :description_en, :start_time, :duration, :language, :min_age, :min_player_count, :max_player_count, :event_id, :user_id)
    end
end
