class SimplemailerMailer < ApplicationMailer

  def new_email(email_details)
  	@email = email_details
    mail(from: email_details[:sender_email],to: email_details[:receiver_email], subject: email_details[:subject])
  end

end