class RegistrationsController < ApplicationController
  expose(:registration)
  expose(:event)

  def create
    registration.event_id = params[:event_id]
    if registration.save
      redirect_to complete_registration_path(event, registration), notice: 'Review your registration'
    else
      render :new, alert: 'You registration was unsuccessful'
    end
  end
end
