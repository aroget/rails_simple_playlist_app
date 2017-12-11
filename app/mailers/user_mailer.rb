class UserMailer < ApplicationMailer
  require 'sendgrid-ruby'
  include SendGrid

  def welcome_message(user)
    mail = Mail.new
    mail.from = Email.new(email: 'andresroget@gmail.com')
    mail.subject = 'Welcome to our App'
    personalization = Personalization.new

    personalization.add_to(Email.new(email: user.email, name: "#{user.first_name} #{user.last_name}"))
    personalization.add_substitution(Substitution.new(key: '%firstname%', value: "#{user.first_name} #{user.last_name}"))

    mail.add_personalization(personalization)

    mail.template_id = '94d7e34f-69cb-4744-a920-e07758c3e842'

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
  end
end
