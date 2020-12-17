class MeetingService
  
  def list_meetings access_token,zoom_user_id
    # url = URI("https://api.zoom.us/v2/users/"+zoom_user_id+"/meetings?page_size=30&type=live")
    url = URI("https://api.zoom.us/v2/users/"+zoom_user_id+"/meetings?page_size=100")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["authorization"] = access_token

    response = http.request(request)
    JSON.parse(response.read_body)
  end
end