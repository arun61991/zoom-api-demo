class UserCreateService
	def initialize(params,access_token)
		@email = params[:email]
		@first_name = params[:first_name]
		@last_name = params[:last_name]
		@type = params[:type]
		@access_token = access_token
	end
	
	

	def create_user		
		begin
			url = URI("https://api.zoom.us/v2/users")

			http = Net::HTTP.new(url.host, url.port)
			http.use_ssl = true
			http.verify_mode = OpenSSL::SSL::VERIFY_NONE

			request = Net::HTTP::Post.new(url)
			request["authorization"] = @access_token
			request["content-type"] = 'application/json'
			request.body = JSON.generate(set_create_user_params)

			response = http.request(request)
			JSON.parse(response.read_body)
		rescue Exception => e
			{ error: e.message }
		end
	end

	private

	def set_create_user_params
		{
			action:"create",
				user_info:{
					email: @email,
					type:@type.to_i,
					first_name: @first_name,
					last_name: @last_name
				}
			}
	end

end