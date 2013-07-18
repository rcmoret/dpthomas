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
end
