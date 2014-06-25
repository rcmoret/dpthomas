class EventsController < ApplicationController
  expose(:future_events) { Event.in_the_future }
  expose(:archived_events){ Event.archived_events }
  expose(:non_archived_events){ Event.non_archived_events }
  expose(:event)

  before_filter :authenticate!, except: [:index, :show]

  def index
    flash[:notice] = "Thank you for your donation" if params[:paypal] && params[:paypal] == 'success'
    @image_files = Dir["#{Rails.root}/app/assets/images/2013_walk_run/*.jpg"].collect do |f|
      f[/2013_walk_run.*$/]
    end
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
end
