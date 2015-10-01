class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  http_basic_authenticate_with :name => ENV["BLOGGER_RAILS_USERNAME"], :password => ENV["BLOGGER_RAILS_PASSWORD"] 
  def params
  	result = super
  	puts result
  	[:controller, :action].each { |key| result.delete(key) }
  	result
  end
  
end
