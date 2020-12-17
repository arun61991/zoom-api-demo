class MeetingsController < ApplicationController
  before_filter :set_meeting, :only => :show
  def new
  end


  def show
    @meeting_id = params[:meeting_id]
    @root_url = root_url
    @role = current_user.id == @meeting.user_id ? 1 : 0
    @password = @meeting.password
    @userName =  @meeting.user.first_name + " " + @meeting.user.last_name
  end

  def create
  	@zoom_meeting = MeetingCreateService.new(meeting_params,session[:access_token]).create_meeting
    @meeting = Meeting.new
    @meeting.topic = meeting_params[:topic]
    @meeting.meeting_type = meeting_params[:type]
    @meeting.start_time = meeting_params[:start_time]
    @meeting.duration = meeting_params[:duration]
    @meeting.password = meeting_params[:password]
    @meeting.user_id = current_user.id
    @meeting.zoom_meeting_id =  @zoom_meeting["id"]
    respond_to do |format|
      if @meeting.save
        format.html { redirect_to users_list_user_path, notice: 'Meeting was successfully Created.' }
      end
    end
  end

  def list_meetings
  	@meetings = MeetingService.new.list_meetings session[:access_token],current_user.zoom_user_id
    @root_url = root_url
  end

  private
    # Only allow a list of trusted parameters through.
    def meeting_params
      params.require(:meeting).permit(:topic, :type, :start_time, :duration, :password, :user_id)
    end

    def set_meeting
      @meeting = Meeting.find_by(zoom_meeting_id: params["meeting_id"])
    end
end
