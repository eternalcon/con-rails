require 'active_support/concern'

module RegistrationConcern
  extend ActiveSupport::Concern

  def fill_participants_array
    val_ar = []

    (0..length_of_params).each do |i|
      val_ar << Participant.new(first_name: params[:part_first_name][i], last_name: params[:part_last_name][i], email: params[:part_email][i], age: params[:part_age][i])
    end

    val_ar
  end


  def check_validity val_ar
    ret_array = []
    return false if val_ar.length == 0

    array_is_valid = true

    val_ar.each_with_index do |participant, index|
      email = participant.email if index == 0

      participant.email = email if participant.email.blank?

      if participant.valid?
        ret_array << participant
      else
        array_is_valid = false
        break
      end
    end

    array_is_valid ? ret_array : false
  end

  private

  def length_of_params
    length = params[:part_first_name].length
    length = params[:part_last_name].length if params[:part_last_name].length > length
    length = params[:part_email].length if params[:part_email].length > length

    length
  end
end