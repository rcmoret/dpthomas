class EventsController < ApplicationController
  expose(:future_events) { Event.where("date > ?", Time.now) }
end
