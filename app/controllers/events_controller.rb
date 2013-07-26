class EventsController < ApplicationController
  expose(:future_events) { Event.in_the_future }
  expose(:event)

  before_filter :authenticate!, except: [:index, :show]

  def create
    if event.save
      redirect_to members_dashboard_path, notice: 'Event successfully created'
    else
      render :new, alert: 'There was an error creating your event'
    end
  end

  def update
    if event.save
      redirect_to events_path, notice: 'Event successfully update'
    else
      render :new, alert: 'There was an error updating your event'
    end
  end
end
