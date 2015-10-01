class EventsController < ApplicationController
  def show
    options = params
  	if options[:key] == "all"
  		@events = Event.sources.map { |s| s[:key] }.map do |key|
  			Event.source(key).events({})
  		end.flatten
  	else
	    @events = Event
	    	.source(options.delete(:key))
	    	.events(options)
	  end
	end
end
