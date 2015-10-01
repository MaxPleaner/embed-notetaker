class PagesController < ApplicationController

  def index
  	@notes = Note.all
  	@note = Note.new
  end
end
