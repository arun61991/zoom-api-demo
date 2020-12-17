class UserService
	def all_users access_token
		begin
			url = URI("https://api.zoom.us/v2/users")

			http = Net::HTTP.new(url.host, url.port)
			http.use_ssl = true
			http.verify_mode = OpenSSL::SSL::VERIFY_NONE

			request = Net::HTTP::Get.new(url)
			request["authorization"] = access_token

			response = http.request(request)
			JSON.parse(response.read_body)
		rescue Exception => e
			{ error: e.message }
		end		
	end

	def delete_user user_id,access_token
		begin
			url = URI("https://api.zoom.us/v2/users/"+user_id+"?action=disassociate")

			http = Net::HTTP.new(url.host, url.port)
			http.use_ssl = true
			http.verify_mode = OpenSSL::SSL::VERIFY_NONE

			request = Net::HTTP::Delete.new(url)
			request["authorization"] = access_token

			response = http.request(request)
			JSON.parse(response.read_body)
		rescue Exception => e
			{ error: e.message }
		end			
	end
end