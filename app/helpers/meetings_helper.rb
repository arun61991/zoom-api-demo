module MeetingsHelper
	def get_pwd url
		url.split('?')[1].present? ? "?"+url.split('?')[1] : " "
	end
end
