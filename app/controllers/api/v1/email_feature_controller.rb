class Api::V1::EmailFeatureController < ActionController::API
  require 'net/imap'
  include Fetchable  

  def send_email
  	email_details = {
   	sender_email: "mayuri.railstest@gmail.com",
   	sender_name: params[:sender_name],
   	receiver_email: params[:receiver_email],
   	subject: params[:subject],
   	message: params[:message]
   	}   	
    SimplemailerMailer.new_email(email_details).deliver_now
    render json: {status: "OK"}
  end

  def list_messages_by_keyword
  	list = get_email_by_keyword(params["keyword"])
  	render json: {ids: list}.to_json
  end	

  def retrieve_email
  	email_details = fetch_email_by_id(params[:id].to_i)
  	render json: {email_details: email_details}.to_json
  end

end