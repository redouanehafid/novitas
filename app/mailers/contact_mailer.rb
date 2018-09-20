class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.send_contact.subject
  #
   def send_contact(thename,from,subject,message)
    @thename = thename
    @from = from
    @subject = subject
    @message = message 

    mg_client = Mailgun::Client.new '0e6e8cad-5ac0b3f3 '
   	message_params = {
      :from    => from,
      :to      => "contactnovitas@gmail.com",
      :subject => subject,
      :text    => message
    }
    mg_client.send_message 'novitas.ma', message_params
    end
end
