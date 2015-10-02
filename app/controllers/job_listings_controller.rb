class JobListingsController < ApplicationController
  def show
  	@key = params[:key]
  	@start = params[:start]
  	@listings = JobListings.send(@key.to_sym, @start.to_i)
  end
end
