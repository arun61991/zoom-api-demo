class MeetingsController < ApplicationController
  def new
  end


  def show
    @meeting_id = params[:meeting_id]
    @root_url = root_url
  end

  def create
  	@meeting = MeetingCreateService.new(meeting_params,session[:access_token]).create_meeting
    respond_to do |format|
      if @meeting
        format.html { redirect_to users_list_user_path, notice: 'Meeting was successfully Created.' }
      end
    end
  end

  def list_meetings
  	@meetings = MeetingService.new.list_meetings session[:access_token],current_user.zoom_user_id
  end

  private
    # Only allow a list of trusted parameters through.
    def meeting_params
      params.require(:meeting).permit(:topic, :type, :start_time, :duration, :password, :user_id)
    end
end
