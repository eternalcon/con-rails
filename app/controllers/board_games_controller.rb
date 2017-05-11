class BoardGamesController < ApplicationController
  before_action :load_event

  def index
    @boardgame_list = BoardGame.where(event_id: @event)
  end

  def new
    @board_game = BoardGame.new
  end

  def create
    @board_game = BoardGame.new(boardgame_params.merge({event_id: @event}))

    if @board_game.save
      redirect_to board_games_path(notice: t('fn_registration_board_game_success'))
    else
      render action: :new
    end
  end

  private

  def load_event
    @event = Event.active_event

    redirect_to root_path if @event.blank?
  end

  def boardgame_params
    params.fetch(:board_game, {}).permit(:title, :event_id, :description, :author_name)
  end
end
