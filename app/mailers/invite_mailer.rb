class InviteMailer < ApplicationMailer
	def new_invite_email(invite)
	    @invite = invite

	    mail(to: @invite.email, subject: "You got a new Invite!")
	end
end
