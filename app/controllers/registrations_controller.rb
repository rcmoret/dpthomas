class RegistrationsController < ApplicationController
  expose(:registration)
  expose(:event)
  expose(:registrations) { event.registrations }

  before_filter :authenticate!, only: :index

  def show
    render :complete
  end

  def update
    registration.event_id = params[:event_id]
    if registration.save
      redirect_to complete_registration_path(event, registration), notice: 'Review your registration'
    else
      render :edit, alert: 'Your registration was unsuccessful'
    end
  end

  def create
    registration.event_id = params[:event_id]
    if registration.save
      redirect_to complete_registration_path(event, registration), notice: 'Review your registration'
    else
      render :new, alert: 'Your registration was unsuccessful'
    end
  end

  private

  def registration_params
    params.require(:registration).permit(*%i(event_id email adults children additional_info))
  end
end
