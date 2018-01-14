class FreeformsController < ApplicationController
  before_action :set_freeform, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @freeforms = Freeform.all
    respond_with(@freeforms)
  end

  def show
    respond_with(@freeform)
  end

  def new
    @freeform = Freeform.new
    respond_with(@freeform)
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
    def set_freeform
      @freeform = Freeform.find(params[:id])
    end

    def freeform_params
      params[:freeform]
    end
end
