class EventsController < ApplicationController
  def show
    @events = Event
    	.source(params.delete(:key))
    	.events(params)
  end
end
