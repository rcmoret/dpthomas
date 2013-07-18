class EventsController < ApplicationController
  expose(:future_events) { Event.where("date > ?", Time.now) }

  before_filter :authenticate!, except: [:index, :show]
end
