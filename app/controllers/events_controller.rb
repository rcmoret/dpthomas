class EventsController < ApplicationController
  expose(:future_events) { Event.in_the_future }
  expose(:archived_events){ Event.archived_events }
  expose(:non_archived_events){ Event.non_archived_events }
  expose(:event)

  before_filter :authenticate!, except: [:index, :show]

  def index
    flash[:notice] = "Thank you for your donation" if params[:paypal] && params[:paypal] == 'success'
  end

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

  private

  def event_params
    params.require(:event).permit(*%i(title date location details has_registration adult_fee
                                      child_fee title name show_past_event))
  end
end
