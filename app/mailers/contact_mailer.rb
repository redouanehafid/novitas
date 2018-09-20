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
      mail to: "contactnovitas@gmail.com", subject: @subject
    end
end
