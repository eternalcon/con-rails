class ParticipantsController < ApplicationController
  def new
    @participant = Participant.new
  end
    
  def create
    @participant = Participant.new(participant_params)
    if verify_recaptcha(model: @participant)
      if Participant.exists?(@participant)
      # Check seems not to be working. The same participant can be generated over and over in the database.
      # OK for now, but might require rework at some point
      # Maybe make participants linked to a user account or something like that...
        flash(:notice => "Participant already exists in Database") 
      else
        if @participant.save
          redirect_to( :controller => "registration", :action => "new", :notice => 'Participant Record Created', :participant => @participant )
        else
          flash(:notice => "Error") 
        end
      end
    else
      render 'new'
    end
  end

  def show
      @participant = Participant.find(params[:id])
  end
  
  private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
    def participant_params
      params.fetch(:participant, {}).permit(:first_name, :last_name, :email, :street, :postcode, :city, :country, :birthdate, :newsletter)
    end
end
