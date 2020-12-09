Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
  	namespace :v1 do
    	match 'email_features/send_email', :controller => 'email_feature', :action => 'send_email', :via => :post
    	match 'email_features/get_ids', :controller => 'email_feature', :action => 'list_messages_by_keyword', :via => :get
    	match 'email_features/retrieve_email', :controller => 'email_feature', :action => 'retrieve_email', :via => :get
  	end
	end
end
