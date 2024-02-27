require 'sendgrid-ruby'
include SendGrid

from = SendGrid::Email.new(email: 'seansayce@tamu.edu')
to = SendGrid::Email.new(email: 'seansayce@tamu.edu')
subject = 'test'
content = SendGrid::Content.new(type: 'text/plain', value: 'test words')
mail = SendGrid::Mail.new(from,subject,to,content)

sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
response = sg.client.mail._('send').post(request_body: mail.to_json)


puts response.status_code
puts response.body
puts response.header