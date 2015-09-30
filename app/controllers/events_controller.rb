class EventsController < ApplicationController
  def show
  	if params[:key] == "all"
  		@events = Event.sources.map { |s| s[:key] }.map do |key|
  			Event.source(key).events({})
  		end.flatten
  	else
	    @events = Event
	    	.source(params.delete(:key))
	    	.events(params)
	  end
	end
end
