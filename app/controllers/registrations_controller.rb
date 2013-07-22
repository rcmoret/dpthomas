class RegistrationsController < ApplicationController
  expose(:registration)
  expose(:event)

  def create
    if registration.save
      redirect_to events_path, notice: 'You have successfully registered'
    else
      render :new, alert: 'You registration was unsuccessful'
    end
  end
end
