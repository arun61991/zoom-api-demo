class MeetingCreateService
	def initialize(params,access_token)
		@topic = params[:topic]
		@start_time = params[:start_time]
		@duration = params[:duration]
		@type = params[:type]
		@password = params[:password]
		@user_id = params[:user_id]
		@access_token = access_token
	end
	
	

	def create_meeting
		
		url = URI("https://api.zoom.us/v2/users/"+@user_id+"/meetings")

		http = Net::HTTP.new(url.host, url.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE
		request = Net::HTTP::Post.new(url)
		request["content-type"] = 'application/json'
		request["authorization"] = @access_token
		request.body = JSON.generate(set_meeting_user_params)
		
		response = http.request(request)
		JSON.parse(response.read_body)
	end

	private

	def set_meeting_user_params
		{
			topic: @topic,
			type: @type,
			start_time: @start_time,
			duration: @duration,
			password: @password
		}
	end

end