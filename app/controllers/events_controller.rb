class EventsController < ApplicationController
  expose(:future_events) { Event.in_the_future }
  expose(:event)

  before_filter :authenticate!, except: [:index, :show]
end
