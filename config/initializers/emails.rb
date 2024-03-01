require 'sendgrid-ruby'
include SendGrid

from = SendGrid::Email.new(email: 'seansayce@tamu.edu')
to = SendGrid::Email.new(email: 'seansayce@gmail.com')
subject = 'test'
content = SendGrid::Content.new(type: 'text/plain', value: 'test words')
mail = SendGrid::Mail.new(from,subject,to,content)

sg = SendGrid::API.new(api_key: 'SG.5aenmBEsQrejCARv-UQQAw.RQjwC7w7Swn3EPE5C4pAqzMkEQ73AzOuvR1q0C2_cas')
response = sg.client.mail._('send').post(request_body: mail.to_json)


puts response.status_code
puts response.body
puts response.headers