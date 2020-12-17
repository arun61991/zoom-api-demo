class SessionsController < Devise::SessionsController
	
	after_filter :after_login, :only => :create

	def after_login
		payload = { aud: nil, iss: 'rEbaFtdIQieenQbk3xOPKA', exp: (DateTime.now + 1.day).strftime('%s').to_i, iat: DateTime.now.strftime('%s').to_i}
		secret = "WatHemxRgmUbsbN61I3riWDEN8Ev3NfHEUYk"
		token = JWT.encode payload, secret, 'HS256'
		session[:access_token] = "Bearer "+token
	end
end