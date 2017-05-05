class FreeformRegistrationsController < ApplicationController
  before_action :check_for_freeform

  def new
    @registration = FreeformRegistration.new
  end

  def create
    @is_create = false
    @registration = FreeformRegistration.new registration_params
    @registration.freeform = @freeform

    if @registration.save
      @is_create = true
      RegistrationMailer.freeform_welcome_email(@registration, @freeform).deliver_later
      RegistrationMailer.freeform_author_email(@registration, @freeform).deliver_later
    end

    if @is_create
      flash[:notice] = t('fn_registration_freeform_success', freeform_title: @freeform.title, email: @registration.email )
      @registration = FreeformRegistration.new
    else
      flash[:error]  = t('fe_registration_error')
    end
  end


  private

  def check_for_freeform
    @freeform = Freeform.where(id: params[:freeform_id], status: StatusValue::Freeform::OPEN ).first

    redirect_to root_path if @freeform.blank?
  end


  def registration_params
    params.fetch(:registration, {}).permit(:name, :email, :notes)
  end
end
