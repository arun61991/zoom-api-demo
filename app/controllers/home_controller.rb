class HomeController < ApplicationController
  def index
  end
  def joinmeeting
  	@password = params[:pwd]
  	@meeting_id = params[:meeting_id]
  	@root_url = root_url
  end
end
