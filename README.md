Steps to run the code:

1. Download the codebase
2. rvm use 2.5.0
3. bundle install
4. Set Env variables (https://medium.com/@youngstone89/setting-up-environment-variables-in-mac-os-28e5941c771c)
		export ADMIN_EMAIL = mayuri.railstest@gmail.com
		export ADMIN_PASSWORD = CA?38b8x%J@dnux
4. Start server - rails s


1. CURL for sending emails via SMTP. 

curl --data "sender_name=example@gmail.com&receiver_email=example@gmail.com&subject=Lorem Epsum&message=Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged." http://localhost:3000/api/v1/email_features/send_email

2. Get the list of message ids via IMAP 
http://localhost:3000/api/v1/email_features/get_ids?keyword=lorem

3. Retrieve email with one of the message ids

http://localhost:3000/api/v1/email_features/retrieve_email?id=1
