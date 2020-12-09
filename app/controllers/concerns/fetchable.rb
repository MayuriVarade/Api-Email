module Fetchable
	extend ActiveSupport::Concern

	def initialise_imap
		imap = Net::IMAP.new("imap.googlemail.com", 993, true, nil, false)
  	imap.login(ENV["ADMIN_EMAIL"], ENV["ADMIN_PASSWORD"])
  	imap.examine("[Gmail]/All Mail")
  	imap
	end	

  def fetch_email_by_id(message_id)
  	message = {}
  	imap = initialise_imap
  	get_email = imap.fetch(message_id, "ENVELOPE")
  	envelope = get_email[0].attr["ENVELOPE"] if get_email.present?
  	if envelope.present?
	  	message[:from] = envelope.from[0].mailbox + '@' + envelope.from[0].host
	  	message[:date] = envelope.date
	  	message[:subject] = envelope.subject
	  	body = imap.fetch(message_id,'BODY[TEXT]')[0].attr['BODY[TEXT]']
	  	message[:body] = body.gsub(/\r\n?/, "")
	  end	
	  message
  end

  def get_email_by_keyword(keyword)
  	imap = initialise_imap
  	ids = imap.search(["SUBJECT", keyword])
  	ids
  end	
end