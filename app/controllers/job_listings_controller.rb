class JobListingsController < ApplicationController
  def show
  	@key = params[:key]
  	@start = params[:start]
  	binding.pry
  	@listings = `#{@key} #{@start}`
  end
end
